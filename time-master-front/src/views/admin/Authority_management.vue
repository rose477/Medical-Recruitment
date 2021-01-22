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
					<h2>权限管理</h2>
					<el-table stripe border :data="tableData" style="width: 100%">
						<el-table-column prop="id" label="id" width="100">
						</el-table-column>
						<el-table-column prop="username" label="用户名" width="180">
						</el-table-column>
						<el-table-column prop="status" label="状态" width="180">
						</el-table-column>
					
						<el-table-column label="操作">
							<template slot-scope="scope">
								<el-button type="primary" @click="upgradeEmployer(scope.row.id)">认证为招聘者</el-button>
								<el-button type="danger" @click="upgradeAdmin(scope.row.id)">认证为管理员</el-button>
							</template>
						</el-table-column>
					</el-table>
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
			}
		},
		mounted() {
			var that = this;
			that.getdatatime(),
			that.requestUser()
		},
		methods: {
			getdatatime() {
				this.value = new Date();
			},
			back() {
				var that = this
				that.$router.push('/')
			},
			upgradeEmployer(id) {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/upgradeemployer/' + id)
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
			upgradeAdmin(id) {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/upgradeadmin/' + id)
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
