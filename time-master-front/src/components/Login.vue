<template>
	<div id='loginpage'>
		<div id='log'>
			<h2 style="text-align:center">用户登录</h2>
			<el-row style="padding: 20px;">
				<el-form ref="form" :model="form" :rules="rules" label-width="80px">
					<el-form-item label="用户名" prop="username">
						<el-input style="width: 200px;" v-model="form.username" placeholder="请输入用户名" class="name"></el-input>
					</el-form-item>
					<el-form-item label="密 码" prop="password">
						<el-input style="width: 200px;" show-password v-model="form.password" placeholder="请输入密码" @keydown.enter.native="submitLogin"></el-input>
					</el-form-item>
					<el-form-item>
						<el-button type="primary" @click="submitLogin">登录</el-button>
						<el-button type="primary" @click="resetForm('form')">重置</el-button>
						<el-button type="primary" @click="onaddUserVisible">注册</el-button>
					</el-form-item>
				</el-form>
			</el-row>

			<el-dialog title="注册新账号" :visible.sync="addUserVisible" width="45%" :before-close="handleClose">
				<el-form ref="addform" :model="addform" :rules="addrule" label-width="80px">
					<el-form-item label="账号:" prop='username' label-width="20%">
						<el-input style="width: 300px;" v-model="addform.username"></el-input>
					</el-form-item>
					<el-form-item label="密码:" prop='password' label-width="20%">
						<el-input style="width: 300px;" show-password v-model="addform.password" placeholder="密码"></el-input>
					</el-form-item>
					<el-form-item label="确认密码:" prop='confirmpassword' label-width="20%">
						<el-input style="width: 300px;" show-password v-model="addform.comfirmpassword" placeholder="确认密码"></el-input>
					</el-form-item>
					<el-form-item label="状态:" prop="status" label-width="20%">
						<el-input style="width: 300px;" v-model="addform.status" placeholder="1代表应聘者,2代表招聘者"></el-input>
					</el-form-item>
					<el-form-item>
						<el-button type="primary" @click="onaddUser">立即注册</el-button>
						<el-button @click="onaddUsercancel">取消</el-button>
					</el-form-item>
				</el-form>
			</el-dialog>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				addUserVisible: false,
				form: {
					username: '',
					password: ''
				},
				addform: {
					username: '',
					password: '',
					status: '',
				},
				rules: {
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
			};
		},
		methods: {
			submitLogin() {
				var that = this
				this.$axios.post('http://localhost:8080/timemaster/userlogin', {
					username: this.form.username,
					password: this.form.password
				}).then(function(response) {
					console.log();
					if (response.data.data != null) {
						alert('登录成功');
						//0->管理员    1->应聘者  2->招聘者
						if (response.data.data.status == 0) {
							that.$router.push('/Admin')
						} else if (response.data.data.status == 1) {
							that.$router.push('/Employee/home')
						} else if (response.data.data.status == 2) {
							that.$router.push('/Employer/employerhome')
						}
					} else {
						that.$message.error(response.data.msg);
					}
				})
			},
			resetForm(formName) {
				this.$refs[formName].resetFields();
			},
			onaddUserVisible() {
				this.addUserVisible = true;
			},
			onaddUser() {
				var that = this
				this.$axios.post('http://localhost:8080/timemaster/adduser', {
					username: this.addform.username,
					password: this.addform.password,
					status: this.addform.status,
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
			onaddUsercancel() {
				this.addUserVisible = false;
			}
		}
	}
</script>

<style>
	#log {
		width: 400px;
		height: 300px;
		position: absolute;
		left: 50%;
		top: 50%;
		margin-left: 200px;
		margin-top: 0px;
		border-radius: 8px;
		background: rgba(0, 0, 0, 0);
		background-repeat: no-repeat;
		background-size: 75% 75%;
		box-shadow: 0 3px 18px rgba(0, 0, 0, 0.5);
	}

	#loginpage {
		width: 90%;
		height: 580px;
		background-image: url(../assets/a3.jpg);
		margin-left: 100px;
		background-repeat: no-repeat;
		background-size: 100% 100%;
		box-shadow: 0 3px 18px rgba(0, 0, 0, 0.5);
	}
</style>
