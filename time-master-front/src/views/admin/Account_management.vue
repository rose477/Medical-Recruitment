<template>
	<div id="app">
		<el-container style="height: 500px; border: 1px solid #eee">
			<el-aside width="200px" style="background-color: rgb(238, 241, 246)">
				<el-menu :default-active="this.$route.path" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" router>
					<h3>后台系统</h3>
					<el-submenu index="1">
						<template slot="title">
							<i class="el-icon-s-custom"></i>
							<span>用户分析</span>
						</template>
						<el-menu-item-group>
							<el-menu-item index="Account_management">用户管理</el-menu-item>
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
					<h2>用户管理</h2>
					<el-row style="padding: 20px;">
						<el-col :span="10">
							<el-input v-model="input" placeholder="请输入用户的id"></el-input>
						</el-col>
						<el-col :span="6">
							<el-button type="primary" icon="el-icon-search" @click='searchUser'>搜索</el-button>
						</el-col>
						<el-col :span="6">
							<el-button type="primary" @click='onaddUserVisible'>增加用户</el-button>
						</el-col>
					</el-row>
					<el-table stripe border :data="tableData" style="width: 100%">
						<el-table-column prop="id" label="id" width="100">
						</el-table-column>
						<el-table-column prop="username" label="用户名" width="180">
						</el-table-column>
						<el-table-column prop="password" show-password label="密码" width="180">
						</el-table-column>
						<el-table-column prop="status" label="状态" width="180">
						</el-table-column>
					
						<el-table-column label="操作">
							<template slot-scope="scope">
								<el-button type="primary" @click="updateUser(scope.row)">修改用户</el-button>
								<el-button type="danger" @click="deleteUser(scope.row.id)">删除用户</el-button>
							</template>
						</el-table-column>
					</el-table>
					
					<el-dialog title="添加用户" :visible.sync="addUserVisible" width="45%" :before-close="handleClose">
						<el-form ref="form" :model="form" :rules="addrule" label-width="80px">
							<el-form-item label="账号:" prop='username' label-width="20%">
								<el-input style="width: 300px;" v-model="form.username"></el-input>
							</el-form-item>
							<el-form-item label="密码:" prop='password' label-width="20%">
								<el-input style="width: 300px;" show-password v-model="form.password" placeholder="密码"></el-input>
							</el-form-item>
							<el-form-item label="确认密码:" prop='confirmpassword' label-width="20%">
								<el-input style="width: 300px;" show-password v-model="form.comfirmpassword" placeholder="确认密码"></el-input>
							</el-form-item>
							<el-form-item label="状态:" prop="status" label-width="20%">
								<el-input style="width: 300px;" v-model="form.status" placeholder="1代表应聘者,2代表招聘者"></el-input>
							</el-form-item>
							<el-form-item>
								<el-button type="primary" @click="onaddUser">立即添加用户</el-button>
								<el-button @click="onaddUsercancel">取消</el-button>
							</el-form-item>
						</el-form>
					</el-dialog>
					<el-dialog title="修改用户" :visible.sync="updateUserVisible" width="45%" :before-close="handleClose">
						<el-form :model="updateUserForm" label-width="80px">
							<el-form-item label="账号:">
								<el-input v-model="updateUserForm.username"></el-input>
							</el-form-item>
							<el-form-item label="密码:">
								<el-input v-model="updateUserForm.password"></el-input>
							</el-form-item>
							<el-form-item label="状态:">
								<el-input v-model="updateUserForm.status"></el-input>
							</el-form-item>
							<el-form-item>
								<el-button type="primary" @click="onUpdateCommit">立即修改用户</el-button>
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
				addUserVisible: false,
				updateUserVisible: false,
				form: {
					username: '',
					password: '',
					status: '',
				},
				updateUserForm: {
					id: 0,
					username: '',
					password: '',
					status: '',
				},
				addrule: {
					username: [{
						required: true,
						message: '请输入用户名',
						trigger: 'blur'
					}],
					password: [{
						required: true,
						message: '请输入密码',
						trigger: 'blur'
					}],
					confirmpassword: [{
						required: true,
						message: '请确认密码',
						trigger: 'blur'
					}],
					status: [{
						required: true,
						message: '请输入状态',
						trigger: 'blur'
					}, {
						min: 1,
						max: 1,
						message: '输入格式错误',
						trigger: 'blur'
					}]
				},
			}
		},
		mounted() {
			var that = this;
			that.getdatatime(),
			this.requestUser()
		},
		methods: {
			getdatatime() {
				this.value = new Date();
			},
			back() {
				var that = this
				that.$router.push('/')
			},
			onaddUser() {
				var that = this
				this.$axios.post('http://localhost:8080/timemaster/adduser', {
					username: this.form.username,
					password: this.form.password,
					status: this.form.status,
				}).then(function(response) {
					console.log()
					if (response.data.code == 0) {
						alert("注册成功!");
						that.addUserVisible = false
					} else {
						that.$message.error(response.data.msg);
					}
				})
			},
			searchUser() {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/finduserbyid/' + this.input, )
					.then(function(response) {
						console.log(response.data.data)
						that.tableData = response.data.data
					})
			},
			onaddUsercancel() {
				this.addUserVisible = false
			},
			onupdatecancel() {
				this.updateUserVisible = false
			},
			onaddUserVisible() {
				this.addUserVisible = true
			},
			updateUser(user) {
				console.log(user)
				this.updateUserForm = user
				this.updateUserVisible = true
			
			},
			onUpdateCommit() {
				var that = this
				this.$axios.post('http://localhost:8080/timemaster/updateuser', {
						id: this.updateUserForm.id,
						Username: this.updateUserForm.Username,
						author: this.updateUserForm.author,
						publisher: this.updateUserForm.publisher
					})
					.then(function(response) {
						console.log()
						if (response.data.code == 0) {
							that.$message({
								message: response.data.msg,
								type: 'success'
							})
							that.updateUserVisible = false
							that.requestUser()
						} else {
							that.$message.error(response.data.msg);
						}
					}).catch(function(error) {
						that.$message.error(error);
					})
			},
			deleteUser(id) {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/deleteuserbyid/' + id)
					.then(function(response) {
						console.log(response.data.msg)
						if (response.data.code == 0) {
							that.$message(response.data.msg);
							that.requestUser()
						} else {
							that.$message.error(response.data.msg);
						}
					})
			},
			requestUser() {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/findalluser')
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
