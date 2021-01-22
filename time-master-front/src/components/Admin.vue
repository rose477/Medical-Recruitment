<template>
	<div>
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
					<el-table :data="tableData">

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
				open: true
			}
		},
		methods: {
			getdatatime() {
				this.value = new Date();
			},
			handleOpen(key, keyPath) {
				console.log(key, keyPath);
			},
			handleClose(key, keyPath) {
				console.log(key, keyPath);
			},
			back() {
				var that = this
				that.$router.push('/')
			}
		},
		mounted() {
			var that = this;
			that.getdatatime()
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
</style>
