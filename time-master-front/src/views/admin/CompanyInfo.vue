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
					<h2>企业简介</h2>
					<el-row style="padding: 20px;">
						<el-col :span="10">
							<el-input v-model="input" placeholder="请输入企业的id"></el-input>
						</el-col>
						<el-col :span="6">
							<el-button type="primary" icon="el-icon-search" @click='searchEmployer'>搜索</el-button>
						</el-col>
						<el-col :span="6">
							<el-button type="primary" @click='onaddEmployerVisible'>增加企业</el-button>
						</el-col>
					</el-row>
					<el-table stripe border :data="tableData" style="width: 100%">
						<el-table-column prop="id" label="id" width="40">
						</el-table-column>
						<el-table-column prop="employername" label="招聘者姓名" width="100">
						</el-table-column>
						<el-table-column prop="employersex" label="性别" width="50">
						</el-table-column>
						<el-table-column prop="employerage" label="年龄" width="50">
						</el-table-column>
						<el-table-column prop="employercompany" label="公司名" width="120">
						</el-table-column>
						<el-table-column prop="employertele" label="联系方式" width="120">
						</el-table-column>
						<el-table-column prop="employeremail" label="邮箱" width="160">
						</el-table-column>
						<el-table-column prop="employerintroduction" label="企业简介" width="120">
						</el-table-column>
					
						<el-table-column label="操作">
							<template slot-scope="scope">
								<el-button type="primary" @click="updateEmployer(scope.row)">修改企业</el-button>
								<el-button type="danger" @click="deleteEmployer(scope.row.id)">删除企业</el-button>
							</template>
						</el-table-column>
					</el-table>
					
					<el-dialog title="添加企业" :visible.sync="addEmployerVisible" width="45%" :before-close="handleClose">
						<el-form ref="form" :model="form" label-width="80px">
							<el-form-item label="姓名:" prop='employername' label-width="20%">
								<el-input style="width: 300px;" v-model="form.employername" placeholder="请输入姓名"></el-input>
							</el-form-item>
							<el-form-item label="性别:" prop='employersex' label-width="20%">
								<el-input style="width: 300px;" v-model="form.employersex" placeholder="请输入性别"></el-input>
							</el-form-item>
							<el-form-item label="年龄:" prop='employerage' label-width="20%">
								<el-input style="width: 300px;" v-model="form.employerage" placeholder="请输入年龄"></el-input>
							</el-form-item>
							<el-form-item label="公司名:" prop="employercompany" label-width="20%">
								<el-input style="width: 300px;" v-model="form.employercompany" placeholder="请输入公司名"></el-input>
							</el-form-item>
							<el-form-item label="联系方式:" prop='employertele' label-width="20%">
								<el-input style="width: 300px;" v-model="form.employertele" placeholder="请输入联系方式"></el-input>
							</el-form-item>
							<el-form-item label="邮箱:" prop='employeremail' label-width="20%">
								<el-input style="width: 300px;" v-model="form.employeremail" placeholder="请输入邮箱"></el-input>
							</el-form-item>
							<el-form-item label="企业简介:" prop="employerintroduction" label-width="20%">
								<el-input style="width: 300px;" v-model="form.employerintroduction" placeholder="请输入企业简介"></el-input>
							</el-form-item>
							<el-form-item>
								<el-button type="primary" @click="onaddEmployer">立即添加企业</el-button>
								<el-button @click="onaddEmployercancel">取消</el-button>
							</el-form-item>
						</el-form>
					</el-dialog>
					<el-dialog title="修改企业" :visible.sync="updateEmployerVisible" width="45%" :before-close="handleClose">
						<el-form :model="updateEmployerForm" label-width="80px">
							<el-form-item label="姓名:">
								<el-input v-model="updateEmployerForm.employername"></el-input>
							</el-form-item>
							<el-form-item label="性别:">
								<el-input v-model="updateEmployerForm.employersex"></el-input>
							</el-form-item>
							<el-form-item label="年龄:">
								<el-input v-model="updateEmployerForm.employerage"></el-input>
							</el-form-item>
							<el-form-item label="公司名:">
								<el-input v-model="updateEmployerForm.employercompany"></el-input>
							</el-form-item>
							<el-form-item label="联系方式:">
								<el-input v-model="updateEmployerForm.employertele"></el-input>
							</el-form-item>
							<el-form-item label="邮箱:">
								<el-input v-model="updateEmployerForm.employeremail"></el-input>
							</el-form-item>
							<el-form-item label="企业简介:">
								<el-input v-model="updateEmployerForm.employerintroduction"></el-input>
							</el-form-item>
							<el-form-item>
								<el-button type="primary" @click="onUpdateCommit">立即修改企业</el-button>
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
				addEmployerVisible: false,
				updateEmployerVisible: false,
				form: {
					employername: '',
					employersex: '',
					employerage: '',
					employercompany: '',
					employertele: '',
					employeremail: '',
					employerintroduction: '',
				},
				updateEmployerForm: {
					id: 0,
					employername: '',
					employersex: '',
					employerage: '',
					employercompany: '',
					employertele: '',
					employeremail: '',
					employerintroduction: '',
				}
			}
		},
		mounted() {
			var that = this;
			that.getdatatime(),
			this.requestEmployer()
		},
		methods: {
			getdatatime() {
				this.value = new Date();
			},
			back() {
				var that = this
				that.$router.push('/')
			},
			onaddEmployer() {
				var that = this
				this.$axios.post('http://localhost:8080/timemaster/addemployer', {
					employername: this.form.employername,
					employersex: this.form.employersex,
					employerage: this.form.employerage,
					employercompany: this.form.employercompany,
					employertele: this.form.employertele,
					employeremail: this.form.employeremail,
					employerintroduction: this.form.employerintroduction,
				}).then(function(response) {
					console.log()
					if (response.data.code == 0) {
						alert("增加企业成功!");
						that.addEmployerVisible = false
						that.requestEmployer()
					} else {
						that.$message.error(response.data.msg);
					}
				})
			},
			searchEmployer() {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/findemployerbyid/' + this.input, )
					.then(function(response) {
						console.log(response.data.data)
						that.tableData = response.data.data
					})
			},
			onaddEmployercancel() {
				this.addEmployerVisible = false
			},
			onupdatecancel() {
				this.updateEmployerVisible = false
			},
			onaddEmployerVisible() {
				this.addEmployerVisible = true
			},
			updateEmployer(Employer) {
				console.log(Employer)
				this.updateEmployerForm = Employer
				this.updateEmployerVisible = true
			
			},
			onUpdateCommit() {
				var that = this
				this.$axios.post('http://localhost:8080/timemaster/updateemployer', {
						id: this.updateEmployerForm.id,
						employername: this.updateEmployerForm.employername,
						employersex: this.updateEmployerForm.employersex,
						employerage: this.updateEmployerForm.employerage,
						employercompany: this.updateEmployerForm.employercompany,
						employertele: this.updateEmployerForm.employertele,
						employeremail: this.updateEmployerForm.employeremail,
						employerintroduction: this.updateEmployerForm.employerintroduction,
					})
					.then(function(response) {
						console.log()
						if (response.data.code == 0) {
							that.$message({
								message: response.data.msg,
								type: 'success'
							})
							that.updateEmployerVisible = false
							that.requestEmployer()
						} else {
							that.$message.error(response.data.msg);
						}
					}).catch(function(error) {
						that.$message.error(error);
					})
			},
			deleteEmployer(id) {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/deleteemployerbyid/' + id)
					.then(function(response) {
						console.log(response.data.msg)
						if (response.data.code == 0) {
							that.$message(response.data.msg);
							that.requestEmployer()
						} else {
							that.$message.error(response.data.msg);
						}
					})
			},
			requestEmployer() {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/findallemployer')
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
