<template>


	<div>

		<Banner></Banner>

		<el-input prefix-icon="el-icon-search" placeholder="搜索职位" v-model="input" class="search">
			<span class="search-button" slot="append" @click='search'>搜索</span>

		</el-input>

		<div class="left">

			<div class="header">
				<span>选择</span>
				<span>清空</span>

			</div>
			<div class="line">
			</div>


			<div>
				<span class="zhiwei">招聘类型</span>

			</div>


			<div class="">
				<el-checkbox-group v-model="checkList" @change="selectBox">
					<el-checkbox class="z1" label="1:实习生">实习生</el-checkbox><br />
					<el-checkbox class="z2" label="2:应届生">应届生</el-checkbox><br />
					<el-checkbox class="z22" label="3:不限">不限</el-checkbox>
				</el-checkbox-group>

			</div>
			<span class="zhiwei2">职位类别</span>
			<el-tree :data="data4" :props="defaultProps" show-checkbox node-key="id" default-expand-all :expand-on-click-node="false"
			 :render-content="renderContent" class="tree">
			</el-tree>
			<span class="zhiwei3">城市</span>
			<div class="city">
				<div>
					<el-checkbox label="北京" class="z3"></el-checkbox>
				</div>
				<div>
					<el-checkbox label="上海" class="z4"></el-checkbox>
				</div>
				<div>
					<el-checkbox label="深圳" class="z5"></el-checkbox>
				</div>
				<div>
					<el-checkbox label="杭州" class="z6"></el-checkbox>
				</div>
				<div>
					<el-checkbox label="长沙" class="z7"></el-checkbox>
				</div>
				<el-select v-model="value8" filterable placeholder="请选择" class="city2">
					<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value">
					</el-option>
				</el-select>
			</div>
			<span class="title2"> 推荐职位({{results2.length }})</span>
			<div class="work2">
				<el-card class="box-card" shadow="hover" v-for="item in results2" :key="item.id">

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
			<div class="line2">

			</div>

		</div>
		<div class="right">
			<span class="title"> 开启新的职位({{ results.length }})</span>
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
				checkList: [],
				values: [], // 存储value的数组
				labels: [], // 存储label的数组
				results: [],
				results2: [],
				input: '',
				value8: '',
				options: [{
						value: '选项1',
						label: '重庆'
					}, {
						value: '选项2',
						label: '广州'
					}, {
						value: '选项3',
						label: '成都'
					}, {
						value: '选项4',
						label: '西安'
					}, {
						value: '选项5',
						label: '武汉'
					},
					{
						value: '选项6',
						label: '南京'
					},
					{
						value: '选项7',
						label: '天津'
					}
				],
				data4: [{
						id: 1,
						label: '临床试验',
						children: [{
								id: 4,
								label: '临床协调',

							},
							{
								id: 5,
								label: '临床数据分析',

							},
							{
								id: 6,
								label: '临床项目经理',

							},
							{
								id: 7,
								label: '临床研究',

							}
						]
					}, {
						id: 2,
						label: '医生',
						children: [{
								id: 8,
								label: 'B超医生'
							}, {
								id: 9,
								label: '检验科医师'
							},
							{
								id: 1,
								label: '药剂师'
							},
							{
								id: 2,
								label: '牙科医生'
							}
						]
					}, {
						id: 3,
						label: '护士/护理',
						children: [{
							id: 10,
							label: '护士长'
						}, {
							id: 11,
							label: '护士'
						}]
					},
					{
						id: 4,
						label: '医疗器械',
						children: [{
							id: 12,
							label: '医疗器械注册'
						}, {
							id: 13,
							label: '医疗器械研发 	'
						}]
					}
				],
				defaultProps: {
					children: 'children',
					label: 'label'
				}
			}

		},
		mounted() {
			this.search();
			this.search2();
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
				var that = this


				this.$axios.get('http://10.135.189.198:8080/timemaster/getPositionBynameOrCompany/' + this.input + that.$route.params
						.name, )
					.then(function(response) {


						if (typeof(that.$route.params.name) == "undefined") {
							that.$route.params.name = '';
							that.fun()

						} else {
							that.$route.params.name = '';
							console.log(response.data.data)
							that.results = response.data.data;
							console.log(that.results)
						}


					})
			},
			search2() {
				var that = this


				this.$axios.get('http://10.135.189.198:8080/timemaster/returnShoucang/', )
					.then(function(response) {



						console.log(response.data.data)
						that.results2 = response.data.data;
						console.log(that.results)



					})
			},
			fun() {

				var that = this

				// const query = this.Bmob.Query("job");
				// query.find().then(res => {
				// 	that.results=res
				// 	console.log(res)

				// });
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

	.work2 {
		position: absolute;
		top: 1200px;
		left: 10%;
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
		top: 20px !important;

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
		left: 4% !important;
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

	.left {
		background-color: #ffffff;
		height: 3000px;
		width: 40%;
		position: absolute;

		top: 500px;
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

	.title2 {
		font-size: 30px;
		font-weight: 700;
		position: absolute;
		top: 1100px;
		left: 30%;
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
</style>
