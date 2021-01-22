K<template>
	<div>
		<Banner></Banner>
		<div class="left2">
			<div style="height: 600px;" class="left1">
				<el-steps direction="vertical" :active="ins">
					<el-step title="选择职位" description="选择你最想去的职位"></el-step>
					<el-step title="投递简历" description="自信的投递简历吧"></el-step>
					<el-step title="等待审核" description="等待公司审核你的简历"></el-step>
					<el-step title="拿到Offer" description="恭喜你开始新的旅程"></el-step>
				</el-steps>
			</div>
		</div>

		<div class="right">
			<span class="title"> 我的收藏({{ results.length }})</span>
			<div class="work">
				<el-card class="box-card" shadow="hover" v-for="item in results" :key="item.id">
					<div>
						<ul class="content-list">
							<li class="content-item">
								<router-link :to="{path:'/employee/work',query:{id:item.id}}">
									<h3 class="jobname">{{ item.company }}-{{item.job}}</h3>
									<div class="subTitle">
										<span class="job_category">{{ item.address }}</span>&nbsp;|
										<span class="job_category">{{ item.jobtype }}</span>&nbsp;|
										<span class="job_category">{{ item.salary }}</span>&nbsp;
										<span class="recruitment_channel"></span>
									</div>
									<p class="desc">要求：{{ item.experience}}</p>
								</router-link>
							</li>
						</ul>
					</div>
				</el-card>
			</div>
		</div>

	</div>
</template>

<script>
	import Banner from '../../components/banner.vue'
	let id = 1000;
	export default {
		name: 'App',
		components: {
			Banner
		},
		data() {
			return {
				ins: 0,
				checkList: [],
				values: [], // 存储value的数组
				labels: [], // 存储label的数组
				results: [],
				input: '',
				value8: '',
			}
		},
		mounted() {
			this.search();
		},

		methods: {
			append(data) {
				const newChild = {
					id: id++,
					label: 'testtest',
					children: []
				};
				if (!data.children) {
					this.$set(data, 'children', []);
				}
				data.children.push(newChild);
			},
			search() {
				const timer = setInterval(() => {

					this.ins += 1
					console.log(this.ins)

				}, 1000);
				// 在beforeDestroy钩子触发时清除定时器
				this.$once('hook:beforeDestroy', () => {
					clearInterval(timer);
				})
				var that = this
				var results2 = '已收藏'
				this.$axios.get('http://10.135.189.198:8080/timemaster/getPositionBynameOrCompany/' + results2, )
					.then(function(response) {
						console.log(response.data.data)
						that.results = response.data.data;
						console.log(results2)
					})
			},

			fun() {
				var that = this
				this.$axios.get('http://10.135.189.198:8080/timemaster/getPositions')
					.then(function(response) {
						that.results = response.data.data

					})
			},
			remove(node, data) {
				const parent = node.parent;
				const children = parent.data.children || parent.data;
				const index = children.findIndex(d => d.id === data.id);
				children.splice(index, 1);
			},
		}
	}
</script>


<style>
	.job_category {
		color: #000000;
	}

	a {
		text-decoration: none;
	}

	.router-link-active {
		text-decoration: none;
	}

	.desc {
		color: #736f6d;
	}

	.type {
		position: absolute;
		top: 38% !important;
		font-size: 15px;
		left: 30px !important;
	}

	.type3 {
		position: absolute;
		top: 58% !important;
		font-size: 15px;
		color: #736f6d;
		left: 30px !important;
	}

	.type4 {
		position: absolute;
		top: 78% !important;
		font-size: 15px;
		color: #736f6d;
		left: 30px !important;
	}

	.jobname {
		position: relative;
		margin-top: -20px;
		font-size: 20px;
		color: #000000;
		font-weight: 700;
	}

	.text {
		font-size: 14px;
	}

	.item {
		margin-bottom: 18px;
	}

	.clearfix:before,
	.clearfix:after {
		display: table;
		content: "";
	}

	.clearfix:after {
		clear: both
	}

	.box-card {
		width: 70%;
		height: 150px;
		position: relative;
		margin-top: 10px;
		left: 3%;
		border-color: #ffffff !important;
	}

	.work {
		position: absolute;
		top: 100px;

		height: 1000px;
		width: 100%;
	}

	.line {
		width: 35%;
		height: 1px;
		position: absolute;
		top: 100px;
		left: 63%;
		background-color: #ddd5d1;
	}

	.line2 {
		width: 1px;
		height: 3000px;
		position: absolute;
		top: 70px;
		left: 99%;
		background-color: #ddd5d1;
	}

	.zhiwei {
		font-size: 24px;
		position: absolute;
		top: 120px;
		left: 63%;
	}

	.city {
		font-size: 24px;
		position: absolute;
		top: 780px;
		left: 64%;
	}

	.city2 {
		font-size: 24px;
		position: absolute;
		top: 180px;

	}

	.zhiwei2 {
		font-size: 24px;
		position: absolute;
		top: 270px;
		left: 63%;
	}

	.z1 {
		position: absolute;
		top: 170px;
		left: 64%;
	}

	.zhiwei3 {
		font-size: 24px;
		position: absolute;
		top: 740px;
		left: 63%;
	}

	.z2 {
		position: absolute;

		top: 180px;
		left: 64%;
	}

	.z22 {
		position: absolute;

		top: 190px;
		left: 64%;
	}

	.tree {
		position: absolute;
		left: 61% !important;
		top: 250px;
	}

	.search {
		z-index: 101;
		width: 65% !important;
		position: absolute;
		left: 16% !important;

		top: 440px !important;


	}

	.header {
		font-size: 14px;
		display: flex;
		justify-content: space-between;
		margin-bottom: 20px;
		left: 63% !important;
		position: absolute;
		top: 70px;
		border-bottom: 1px solid @border-lighter-color;
		padding-bottom: 10px;
		width: 35%;
	}



	.right {
		background-color: #ffffff;
		height: 3000px;
		width: 60%;
		position: absolute;
		right: 0%;
		top: 500px;
	}

	.title {
		font-size: 30px;
		font-weight: 700;
		position: absolute;
		top: 50px;
		left: 3%;
	}

	.search-button {


		color: #fff;
		text-align: center;
		position: absolute;
		right: -21px;
		top: -1px;

		width: 90px;
		height: 105%;
		background: #0055ff;
		display: flex;
		border-top-right-radius: 100px;
		border-bottom-right-radius: 100px;
		justify-content: center;
		align-items: center;
		cursor: pointer;

		/* height: 50px;
		background-color: #3A8EE6 !important;
		color: #fff !important; */

	}

	/deep/ .el-input__inner {
		border-color: #3A8EE6;
		/*或者 .s2>>>.el-input__inner  */
		background: #fff;
		/*调整inner的背景色，透明*/
		height: 50px;
		/*调整inner的高度*/
		border-radius: 100px !important;
		/*输入框圆角值*/
		border-width: 1px;

	}

	.search {
		z-index: 101;
		width: 70%;
		position: absolute;
		left: 14%;

		top: 50%;


	}

	.left2 {
		position: absolute;
		left: 14%;

		top: 600px;
	}
</style>
