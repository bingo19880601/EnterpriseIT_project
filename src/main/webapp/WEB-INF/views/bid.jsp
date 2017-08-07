<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var projectDataGrid;
    var organizationTree;

    $(function() {
        organizationTree = $('#organizationTree').tree({
            url : '${path }/organization/tree',
            parentField : 'pid',
            lines : true,
            onClick : function(node) {
                userDataGrid.datagrid('load', {
                    organizationId: node.id
                });
            }
        });

        projectDataGrid = $('#projectDataGrid').datagrid({
            url : '${path }/project/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
            sortName : 'createTime',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '80',
                title : '登录名',
                field : 'loginName',
                sortable : true
            }, {
                width : '80',
                title : '姓名',
                field : 'name',
                sortable : true
            },{
                width : '80',
                title : '部门ID',
                field : 'organizationId',
                hidden : true
            },{
                width : '80',
                title : '所属部门',
                field : 'organizationName'
            },{
                width : '130',
                title : '创建时间',
                field : 'createTime',
                sortable : true
            },  {
                width : '40',
                title : '性别',
                field : 'sex',
                sortable : true,
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '男';
                    case 1:
                        return '女';
                    }
                }
            }, {
                width : '40',
                title : '年龄',
                field : 'age',
                sortable : true
            },{
                width : '120',
                title : '电话',
                field : 'phone',
                sortable : true
            }, 
            {
                width : '200',
                title : '角色',
                field : 'rolesList'
            }, {
                width : '60',
                title : '用户类型',
                field : 'userType',
                sortable : true,
                formatter : function(value, row, index) {
                    if(value == 0) {
                        return "管理员";
                    }else if(value == 1) {
                        return "用户";
                    }
                    return "未知类型";
                }
            },{
                width : '60',
                title : '状态',
                field : 'status',
                sortable : true,
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '正常';
                    case 1:
                        return '停用';
                    }
                }
            } , {
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/project/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editProjectFun(\'{0}\');" >编辑</a>', row.id);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/project/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteProjectFun(\'{0}\');" >删除</a>', row.id);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.user-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.user-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#projectToolbar'
        });
    });
    
    function addProjectFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 300,
            href : '${path }/project/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = userDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#projectAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteProjectFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = projectDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            userDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前用户？', function(b) {
            if (b) {
                progressLoad();
                $.post('${path }/project/delete', {
                    id : id
                }, function(result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        projectDataGrid.datagrid('reload');
                    } else {
                        parent.$.messager.alert('错误', result.msg, 'error');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }
    
    function editProjectFun(id) {
        if (id == undefined) {
            var rows = projectDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            userDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 500,
            height : 300,
            href : '${path }/project/editPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = projectDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#projectEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function searchProjectFun() {
        userDataGrid.datagrid('load', $.serializeObject($('#searchProjcetForm')));
    }
    function cleanProjectFun() {
        $('#searchProjcetForm input').val('');
        $('#searchProjcetForm select').val('全部');
        userDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchProjcetForm">
            <table>
                <tr>
                    <th>项目名称:</th>
                    <td><input name="name" placeholder="请输入项目名称"/></td>
                    <th>项目状态:</th>
                    <td>
	                    <select>
	                    	<option>全部</option>
	                    	<option>竞标中</option>
	                    	<option>竞标成功</option>
	                    	<option>竞标失败</option>
	                    </select>
                    </td>
                    <th>创建时间:</th>
                    <td>
                        <input name="createdateStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至
                        <input  name="createdateEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchProjectFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanProjectFun();">清空</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-plus',plain:true" onclick="addProjectFun();">项目新增</a>
                    </td>
                    
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'项目列表'" >
        <table id="projectDataGrid" data-options="fit:true,border:false"></table>
    </div>
    <div data-options="region:'west',border:true,split:false,title:'项目组织'"  style="width:150px;overflow: hidden; ">
        <ul id="projectTree" style="width:160px;margin: 10px 10px 10px 10px"></ul>
    </div>
</div>
<div id="projectToolbar" style="display: none;">
    <shiro:hasPermission name="/project/add">
        <a onclick="addProjectFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>