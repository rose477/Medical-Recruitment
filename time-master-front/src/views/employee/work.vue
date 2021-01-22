<template>
	<div>
		<div class="top1"></div>
		<div v-for="item in results" :key="item.id">
			<h1 class="w1">{{ item.company }}-{{item.job}}</h1>
			<span class="w2">{{ item.address }} | {{ item.jobtype }} | {{ item.salary }}</span>

			<h3 class="w3">职位要求</h3>
			<div class="w4">
				<span class="w61">1.{{ results2[0].describesA}}</span><br /><br />
				<span class="w61">2.{{ results2[1].describesA}} </span><br /><br />
				<span class="w61">3.{{ results2[2].describesA}}</span>
			</div>
			<h3 class="w5">职位福利</h3>
			<div class="w6">
				<span class="w61">1.{{ results2[3].describesA}}</span><br /><br />
				<span class="w61">2.{{ results2[4].describesA}}</span><br /><br />
				<span class="w61">3.{{ results2[5].describesA}}</span>
			</div>
			<router-link :to="{name:'jianli',params:{company:item.company}}">

				<el-button type="primary" round class="w7">
					投递简历
				</el-button>
			</router-link>
			<el-button v-for="value in results" type="warning" round class="w71" v-model="describes" @click='onUpdateCommit'>
				{{results[0].describes}}
			</el-button>
		</div>

		<div class="w10">


			<div class="el-footer1">
				<el-row :gutter="20">
					<el-col :span="6">
						<div class="grid-content bg-purple1">
							<dl>
								<dt>企业服务</dt>
								<dd style="position: relative;left: -25px;">
									<h6>在线客服</h6>
									<h6>新闻资讯</h6>
								</dd>
							</dl>
						</div>
					</el-col>
					<el-col :span="6">
						<div class="grid-content bg-purple1">
							<dl>
								<dt>使用与帮助</dt>
								<dd style="position: relative;left: -30px;">
									<h6>防骗指南</h6>
									<h6>使用帮助</h6>
								</dd>
							</dl>
						</div>
					</el-col>
					<el-col :span="6">
						<div class="grid-content bg-purple1">
							<dl>
								<dt>联系我们</dt>
								<dd style="position: relative;left: 103px;width: 170px;">
									<h6>公司地址：湖南中医药大学</h6>
									<h6 style="position: relative;left: -18px;">公司电话：3838438</h6>
								</dd>
							</dl>
						</div>
					</el-col>
					<div>
						<span class="demonstration1" style="position: relative;left: 70px;">二维码</span>
						<el-image style="width: 100px; height: 100px;position: absolute;bottom: 0%;" :src="url" :preview-src-list="srcList">
						</el-image>
					</div>
				</el-row>
				<p>Copyright2020-2021 ybl.com .All Rights Reserved</p>
			</div>

		</div>
	</div>
</template>

<script>
	export default {

		name: 'App',
		mounted() {
			this.search();
		},
		data() {
			return {
				srcList: [
					'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg'
				],
				url: 'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
				results: [],
				results2: [],
				describes: '',
			}
		},
		methods: {
			search2() {
				var that = this


				this.$axios.get('http://10.135.189.198:8080/timemaster/tianjiashoucang/' + that.results[0].worktime, )
					.then(function(response) {




						console.log(that.results[0].worktime, )



					})
			},
			search() {
				var that = this

				this.$axios.get('http://10.135.189.198:8080/timemaster/getPositionBynameOrCompany/' + this.$route.query.id, )
					.then(function(response) {
						console.log(response.data.data)
						that.results = response.data.data;
						that.results2 = response.data.data[0].jobdescribes;
						console.log(response.data.data[0].jobdescribes)
						that.search2()
					})
			},
			onUpdateCommit() {
				var that = this
				// var that = this
				// const query = this.Bmob.Query('Booktest');
				// query.set('id', this.updateBookForm.objectId) //需要修改的objectId
				// query.set('name', this.updateBookForm.name)
				// query.set('author', this.updateBookForm.author)
				// query.set('price', this.updateBookForm.price)

				// query.save().then(res => {
				// 	console.log(res)
				// 	that.updateBookVisible = false
				// 	that.requestBook()
				// }).catch(err => {
				// 	console.log(err)
				// })
				if ((that.results[0].describes) == ("已收藏")) {
					this.$axios.post('http://10.135.189.198:8080/timemaster/modifyJob', {



							id: that.results[0].id,
							job: that.results[0].job,
							company: that.results[0].company,
							salary: that.results[0].salary,
							Jobtype: that.results[0].Jobtype,
							experience: that.results[0].experience,
							address: that.results[0].address,
							worktime: that.results[0].worktime,
							describes: "收藏",
							jobdescribes: that.results[0].jobdescribes,
							jobtype: that.results[0].jobtype,


						})
						.then(function(response) {
							console.log(that.results[0].address)
							if (response.data.code == 0) {
								that.$message({
									message: response.data.msg,
									type: 'success',

								})

								that.search()
							} else {
								that.$message.error(response.data.msg);
							}
						}).catch(function(error) {
							that.$message.error(error);
						})
				} else {

					this.$axios.post('http://10.135.189.198:8080/timemaster/modifyJob', {



							id: that.results[0].id,
							job: that.results[0].job,
							company: that.results[0].company,
							salary: that.results[0].salary,
							Jobtype: that.results[0].Jobtype,
							experience: that.results[0].experience,
							address: that.results[0].address,
							worktime: that.results[0].worktime,
							describes: "已收藏",
							jobdescribes: that.results[0].jobdescribes,
							jobtype: that.results[0].jobtype,


						})
						.then(function(response) {
							console.log(that.results[0].address)
							if (response.data.code == 0) {
								that.$message({
									message: response.data.msg,
									type: 'success',

								})

								that.search()
							} else {
								that.$message.error(response.data.msg);
							}
						}).catch(function(error) {
							that.$message.error(error);
						})
				}

			},

		}
	}
</script>

<style>
	.top1 {
		background-color: #550000;
		height: 85px !important;
		position: relative;
		left: -100px;
		width: 120%;
	}

	.w1 {
		position: absolute;
		left: 10%;
		top: 15%;
	}

	.w2 {
		position: absolute;
		left: 10%;
		top: 28%;
	}

	.w3 {
		position: absolute;
		left: 10%;
		top: 30%;
	}

	.w4 {
		position: absolute;
		left: 10%;
		width: 200px;
		top: 40%;
	}

	.w5 {
		position: absolute;
		left: 10%;
		top: 55%;
	}

	.w6 {
		position: absolute;
		left: 10%;
		width: 200px;
		top: 65%;
	}

	.w61 {
		position: absolute;
		left: 10%;

	}

	.w7 {
		color: #FFFFFF;
		position: absolute;
		left: 10%;
		top: 90%;
	}

	.w71 {
		color: #FFFFFF;
		position: absolute;
		left: 28%;
		top: 90%;
		width: 110px;

	}

	.el-row1 {
		margin-bottom: 20px;

		&:last-child {
			margin-bottom: 0;
		}
	}

	.el-col1 {
		border-radius: 4px;
	}

	.bg-purple-dark1 {
		background: #99a9bf;
	}

	.bg-purple1 {
		background: darkslategrey;
	}

	.bg-purple-light1 {
		background: #e5e9f2;
	}

	.grid-content1 {
		border-radius: 4px;
		min-height: 36px;
	}

	.row-bg1 {
		padding: 10px 0;
		background-color: #f9fafc;
	}

	.el-footer1 {
		height: 200px;
		line-height: 20px;
		position: absolute;
		top: 700px !important;
		left: 0;
		width: 100%;
		text-align: center;
		background-color: darkslategrey;
		color: #fff;
		font-family: Arial;
		font-size: 14px;
		letter-spacing: 1px;
	}
</style>
