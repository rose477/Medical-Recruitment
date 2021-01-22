<template>
	<div id="app">
		<el-container style="height: 500px; border: 1px solid #eee">
			<el-aside width="200px" style="background-color: rgb(238, 241, 246)">
				<el-menu :default-active="this.$route.path" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" router>
					<h3>后台系统</h3>
					<el-submenu index="1">
						<template slot="title">
							<i class="el-icon-s-custom"></i>
							<span>企业分析</span>
						</template>
						<el-menu-item-group>
							<el-menu-item index="Account_management">企业管理</el-menu-item>
							<el-menu-item index="Authority_management">权限管理</el-menu-item>
						</el-menu-item-group>
					</el-submenu>
					<el-submenu index="2">
						<template slot="title">
							<i class="el-icon-upload"></i>
							<span>资料上传</span>
						</template>

						<el-menu-item-group>
							<el-menu-item index="CompanyInfo">企业简介</el-menu-item>
							<el-menu-item index="PersonInfo">个人简介</el-menu-item>
							<el-menu-item index="NewsInfo">资讯动态</el-menu-item>
						</el-menu-item-group>

					</el-submenu>
					<el-menu-item index="CollectList">
						<i class="el-icon-star-on"></i>
						<span slot="title">收藏列表</span>
					</el-menu-item>
				</el-menu>
			</el-aside>
			<el-container>
				<el-header style="text-align: right; font-size: 12px">
					<span>admin</span>
					<el-dropdown>
						<i class="el-icon-setting" style="margin-right: 15px"></i>
						<el-dropdown-menu slot="dropdown">
							<el-dropdown-item @click.native="back">退出登录</el-dropdown-item>
						</el-dropdown-menu>
					</el-dropdown>
				</el-header>

				<el-main>
					<h2>个人简介</h2>
					<el-row style="padding: 20px;">
						<el-col :span="10">
							<el-input v-model="input" placeholder="请输入个人的id"></el-input>
						</el-col>
						<el-col :span="6">
							<el-button type="primary" icon="el-icon-search" @click='searchEmployee'>搜索</el-button>
						</el-col>
						<el-col :span="6">
							<el-button type="primary" @click='onaddEmployeeVisible'>增加个人</el-button>
						</el-col>
					</el-row>
					<el-table stripe border :data="tableData" style="width: 100%">
						<el-table-column prop="id" label="id" width="40">
						</el-table-column>
						<el-table-column prop="employeename" label="应聘者姓名" width="100">
						</el-table-column>
						<el-table-column prop="employeesex" label="性别" width="50">
						</el-table-column>
						<el-table-column prop="employeeage" label="年龄" width="50">
						</el-table-column>
						<el-table-column prop="employeeschool" label="毕业学校" width="120">
						</el-table-column>
						<el-table-column prop="employeetele" label="联系方式" width="120">
						</el-table-column>
						<el-table-column prop="employeeemail" label="邮箱" width="160">
						</el-table-column>
						<el-table-column prop="employeeintroduction" label="个人简介" width="120">
						</el-table-column>
					
						<el-table-column label="操作">
							<template slot-scope="scope">
								<el-button type="primary" @click="updateEmployee(scope.row)">修改个人</el-button>
								<el-button type="danger" @click="deleteEmployee(scope.row.id)">删除个人</el-button>
							</template>
						</el-table-column>
					</el-table>
					
					<el-dialog title="添加个人" :visible.sync="addEmployeeVisible" width="45%" :before-close="handleClose">
						<el-form ref="form" :model="form" label-width="80px">
							<el-form-item label="姓名:" prop='employeename' label-width="20%">
								<el-input style="width: 300px;" v-model="form.employeename" placeholder="请输入姓名"></el-input>
							</el-form-item>
							<el-form-item label="性别:" prop='employeesex' label-width="20%">
								<el-input style="width: 300px;" v-model="form.employeesex" placeholder="请输入性别"></el-input>
							</el-form-item>
							<el-form-item label="年龄:" prop='employeeage' label-width="20%">
								<el-input style="width: 300px;" v-model="form.employeeage" placeholder="请输入年龄"></el-input>
							</el-form-item>
							<el-form-item label="毕业学校:" prop="employeeschool" label-width="20%">
								<el-input style="width: 300px;" v-model="form.employeeschool" placeholder="请输入毕业学校"></el-input>
							</el-form-item>
							<el-form-item label="联系方式:" prop='employeetele' label-width="20%">
								<el-input style="width: 300px;" v-model="form.employeetele" placeholder="请输入联系方式"></el-input>
							</el-form-item>
							<el-form-item label="邮箱:" prop='employeeemail' label-width="20%">
								<el-input style="width: 300px;" v-model="form.employeeemail" placeholder="请输入邮箱"></el-input>
							</el-form-item>
							<el-form-item label="个人简介:" prop="employeeintroduction" label-width="20%">
								<el-input style="width: 300px;" v-model="form.employeeintroduction" placeholder="请输入个人简介"></el-input>
							</el-form-item>
							<el-form-item>
								<el-button type="primary" @click="onaddEmployee">立即添加个人</el-button>
								<el-button @click="onaddEmployeecancel">取消</el-button>
							</el-form-item>
						</el-form>
					</el-dialog>
					<el-dialog title="修改个人" :visible.sync="updateEmployeeVisible" width="45%" :before-close="handleClose">
						<el-form :model="updateEmployeeForm" label-width="80px">
							<el-form-item label="姓名:">
								<el-input v-model="updateEmployeeForm.employeename"></el-input>
							</el-form-item>
							<el-form-item label="性别:">
								<el-input v-model="updateEmployeeForm.employeesex"></el-input>
							</el-form-item>
							<el-form-item label="年龄:">
								<el-input v-model="updateEmployeeForm.employeeage"></el-input>
							</el-form-item>
							<el-form-item label="毕业学校:">
								<el-input v-model="updateEmployeeForm.employeeschool"></el-input>
							</el-form-item>
							<el-form-item label="联系方式:">
								<el-input v-model="updateEmployeeForm.employeetele"></el-input>
							</el-form-item>
							<el-form-item label="邮箱:">
								<el-input v-model="updateEmployeeForm.employeeemail"></el-input>
							</el-form-item>
							<el-form-item label="个人简介:">
								<el-input v-model="updateEmployeeForm.employeeintroduction"></el-input>
							</el-form-item>
							<el-form-item>
								<el-button type="primary" @click="onUpdateCommit">立即修改个人</el-button>
								<el-button @click="onupdatecancel">取消</el-button>
							</el-form-item>
						</el-form>
					</el-dialog>
				</el-main>
			</el-container>
		</el-container>
		<el-footer style="height: 30px; border: 1px solid #eee">
			<el-date-picker v-model="value" type="date" class="input-class">
			</el-date-picker>
		</el-footer>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				value: '',
				open: true,
				tableData: [],
				input: '',
				addEmployeeVisible: false,
				updateEmployeeVisible: false,
				form: {
					employeename: '',
					employeesex: '',
					employeeage: '',
					employeeschool: '',
					employeetele: '',
					employeeemail: '',
					employeeintroduction: '',
				},
				updateEmployeeForm: {
					id: 0,
					employeename: '',
					employeesex: '',
					employeeage: '',
					employeeschool: '',
					employeetele: '',
					employeeemail: '',
					employeeintroduction: '',
				}
			}
		},
		mounted() {
			var that = this;
			that.getdatatime(),
			this.requestEmployee()
		},
		methods: {
			getdatatime() {
				this.value = new Date();
			},
			back() {
				var that = this
				that.$router.push('/')
			},
			onaddEmployee() {
				var that = this
				this.$axios.post('http://localhost:8080/timemaster/addemployee', {
					employeename: this.form.employeename,
					employeesex: this.form.employeesex,
					employeeage: this.form.employeeage,
					employeeschool: this.form.employeeschool,
					employeetele: this.form.employeetele,
					employeeemail: this.form.employeeemail,
					employeeintroduction: this.form.employeeintroduction,
				}).then(function(response) {
					console.log()
					if (response.data.code == 0) {
						alert("增加个人成功!");
						that.addEmployeeVisible = false
						that.requestEmployee()
					} else {
						that.$message.error(response.data.msg);
					}
				})
			},
			searchEmployee() {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/findemployeebyid/' + this.input, )
					.then(function(response) {
						console.log(response.data.data)
						that.tableData = response.data.data
					})
			},
			onaddEmployeecancel() {
				this.addEmployeeVisible = false
			},
			onupdatecancel() {
				this.updateEmployeeVisible = false
			},
			onaddEmployeeVisible() {
				this.addEmployeeVisible = true
			},
			updateEmployee(Employee) {
				console.log(Employee)
				this.updateEmployeeForm = Employee
				this.updateEmployeeVisible = true
			
			},
			onUpdateCommit() {
				var that = this
				this.$axios.post('http://localhost:8080/timemaster/updateemployee', {
						id: this.updateEmployeeForm.id,
						employeename: this.updateEmployeeForm.employeename,
						employeesex: this.updateEmployeeForm.employeesex,
						employeeage: this.updateEmployeeForm.employeeage,
						employeeschool: this.updateEmployeeForm.employeeschool,
						employeetele: this.updateEmployeeForm.employeetele,
						employeeemail: this.updateEmployeeForm.employeeemail,
						employeeintroduction: this.updateEmployeeForm.employeeintroduction,
					})
					.then(function(response) {
						console.log()
						if (response.data.code == 0) {
							that.$message({
								message: response.data.msg,
								type: 'success'
							})
							that.updateEmployeeVisible = false
							that.requestEmployee()
						} else {
							that.$message.error(response.data.msg);
						}
					}).catch(function(error) {
						that.$message.error(error);
					})
			},
			deleteEmployee(id) {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/deleteemployeebyid/' + id)
					.then(function(response) {
						console.log(response.data.msg)
						if (response.data.code == 0) {
							that.$message(response.data.msg);
							that.requestEmployee()
						} else {
							that.$message.error(response.data.msg);
						}
					})
			},
			requestEmployee() {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/findallemployee')
					.then(function(response) {
						that.tableData = response.data.data
					})
			}
		}
	}
</script>

<style>
	.el-header {
		background-color: #B3C0D1;
		color: #333;
		line-height: 60px;
	}

	.el-aside {
		color: #333;
	}

	.input-class {
		width: 150px;
		height: 30px;
	}
	
	#app {
		font-family: Avenir, Helvetica, Arial, sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		text-align: center;
		color: #2c3e50;
		margin-top: 60px;
	}
</style>
