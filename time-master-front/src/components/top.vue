<template>
	<div class="top">
		<el-row type="flex" class="row-bg" justify="center">
			<el-col :span="4">
				<div class="grid-content bg-purple">
					<h1 class="h4">医伯乐</h1>
				</div>
			</el-col>
			<el-col :span="10">
				<div class="grid-content bg-purple">
				</div>
			</el-col>
			<el-col :span="2">
				<div class="grid-content bg-purple">
					<router-link to="/employee/home">
						<el-button type="text" class="top_button">
							首页
						</el-button>
					</router-link>
				</div>
			</el-col>
			<el-col :span="2">
				<div class="grid-content bg-purple">
					<router-link to="/employee/job">
						<el-button type="text" class="top_button">
							职位查看
						</el-button>
					</router-link>
				</div>
			</el-col>
			<el-col :span="2">
				<div class="grid-content bg-purple-light">
					<router-link :to="{name:'jianli',params:{name:'投递简历'}}">
						<el-button type="text" class="top_button"> 投递简历</el-button>
					</router-link>
				</div>
			</el-col>
			<el-col :span="2">
				<div class="grid-content bg-purple">
					<a href="http://4otwx.gylb58.com/downpage/f23909d6aa9f4aa5" target="_blank">
						<el-button type="text" class="top_button">App</el-button>
					</a>
				</div>
			</el-col>
			<el-col :span="2">
				<div class="grid-content bg-purple">
					<el-dropdown class="user">
						<span class="el-dropdown-link">
							employee<i class="el-icon-arrow-down el-icon--right"></i>
						</span>
						<el-dropdown-menu slot="dropdown">
							<el-dropdown-item>账户修改</el-dropdown-item>
							<el-dropdown-item>关于我们</el-dropdown-item>
							<router-link to="/employee/job2">
								<el-dropdown-item>我的收藏</el-dropdown-item>
							</router-link>
							<router-link to="/">
								<el-dropdown-item divided>退出</el-dropdown-item>
							</router-link>
						</el-dropdown-menu>
					</el-dropdown>
				</div>
			</el-col>
		</el-row>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				isActive: -1,
			}
		},
		methods: {
			checkedItem(index) {
				this.isActive = index;
			},
		}
	}
</script>

<style>
	.top_button {
		font-size: 16px;
		color: #fff !important;
	}

	.top {
		top: 20px;
		position: absolute;
		z-index: 100;
		width: 100%;
		height: 100%;
	}

	.h4 {
		margin-top: -2px;
		margin-left: 80px;
		position: absolute;
		color: #FFFFFF;
		font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
		font: 100px;
		letter-spacing: 20px;
	}

	.user {
		position: absolute;
		margin-top: 10px;
		color: #FFFFFF;
	}
</style>
