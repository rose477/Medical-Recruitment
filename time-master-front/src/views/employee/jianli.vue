<template>
	<div>
		<div class="top2"></div>
		<div v-for="item in results" :key="item.id">
			<h1 class="j1">{{ item.company +item.job}}</h1>
		</div>
		<h1 class="j1"> {{$route.params.name}}</h1>
		<div>
			<h3 class="j4">基础信息</h3>
			<div class="j5"></div>
			<h5 class="j6">姓名(必填)</h5>
			<h2 class="j2">附件简历</h2>
			<span class="j7">请填写基本信息</span>
			<el-input v-model="input2" placeholder="请输入内容" class="j8"></el-input>
			<h5 class="j9">手机号码(必填)</h5>
			<div class="j10">
				<el-input placeholder="请输入内容" v-model="numbers">
					<el-select v-model="select" slot="prepend" placeholder="+86">
						<el-option label="中国大陆 +86" value="1"></el-option>
						<el-option label="中国澳门 +853" value="2"></el-option>
						<el-option label="法国 +33" value="3"></el-option>
					</el-select>
				</el-input>
			</div>
			<h5 class="j11">邮箱 (必填)</h5>
			<div class="j12">
				<el-input v-model="email" placeholder="请输入内容"></el-input>
			</div>
			<h5 class="l1">个人证件(必填)</h5>
			<div class="l2">
				<el-input placeholder="请输入内容" v-model="idcard">
					<el-select v-model="select" slot="prepend" placeholder="中国-居民身份证">
						<el-option label="中国-居民身份证" value="1"></el-option>
						<el-option label="中国-港澳居民来往内地通行证" value="2"></el-option>
						<el-option label="中国-台湾居民来往内地通行证" value="3"></el-option>
						<el-option label="中国-港澳居民居住证" value="4"></el-option>
						<el-option label="中国-台湾居民居住证" value="5"></el-option>
						<el-option label="护照" value="6"></el-option>
						<el-option label="其他" value="7"></el-option>
					</el-select>
				</el-input>
			</div>
			<h5 class="l3">意向地点</h5>
			<div class="l4" style="min-width: 500px;">
				<el-input v-model="intentionLocation" placeholder="请输入你想要去的城市"></el-input>
			</div>
		</div>
		<div class="l5"></div>
		<h3 class="j41">教育经历</h3>
		<div class="j51"></div>
		<h5 class="j61">学校(必填)</h5>
		<span class="j71">请填写教育经历</span>
		<el-input v-model="school" placeholder="请输入内容" class="j81"></el-input>
		<h5 class="j91">学历(必填)</h5>
		<div class="j101">
			<el-input v-model="education" placeholder="请输入内容"></el-input>
		</div>
		<h5 class="j111">专业 (必填)</h5>
		<div class="j121">
		</div>
		<div class="l21">
			<el-input placeholder="请输入内容" v-model="major">
			</el-input>
		</div>
		<h5 class="l31">其他</h5>
		<div class="l41" style="min-width: 500px;">
			<el-input v-model="others" placeholder="可以在这里进行补充"></el-input>
		</div>
		<div class="l51"></div>
		<h3 class="j411">其他描述</h3>
		<div class="j511"></div>
		<div class="l211">
			<el-input placeholder="请输入内容" v-model="otherDescribe">
			</el-input>
		</div>
		<div class="j3">
			<el-upload class="upload-demo" drag action="https://jsonplaceholder.typicode.com/posts/" multiple>
				<i class="el-icon-upload"></i>
				<div class="el-upload__text">将简历拖到此处，或<em>点击上传</em></div>
				<div class="el-upload__tip" slot="tip">支持格式：pdf、doc、docx、ppt、pptx、png、jng、jepg</div>
			</el-upload>
		</div>
		<div class="w11">
			<div class="el-footer11">
				<el-row :gutter="20">
					<el-col :span="6">
						<div class="grid-content bg-purple11">
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
						<div class="grid-content bg-purple11">
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
						<div class="grid-content bg-purple11">
							<dl>
								<span>联系我们</span>
								<dd style="position: relative;left: 28px;">

									<h6>公司地址：湖南中医药大学</h6>
									<h6 style="position: relative;left: -18px;">公司电话：3838438</h6>
								</dd>
							</dl>
						</div>
					</el-col>
					<div>
						<span class="demonstration11" style="position: relative;left: 70px;">二维码</span>
						<el-image style="width: 100px; height: 100px;position: absolute;bottom: 0%;" :src="url" :preview-src-list="srcList">
						</el-image>
					</div>
				</el-row>
				<p>Copyright2020-2021 ybl.com .All Rights Reserved</p>
			</div>
		</div>
		<div class="bottom">
			<div class="bottom1">
				<el-checkbox v-model="checked">我已同意隐私政策</el-checkbox>&nbsp
				<el-button type="primary" @click="commitJianli" round>
					提交简历
				</el-button>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		name: 'App2',
		mounted() {
			this.search();
		},
		data() {
			return {
				results2: '',
				checked: false,
				input: '',
				input2: '',
				email: '',
				idcard: '',
				numbers: '',
				input6: '',
				intentionLocation: '',
				education: '',
				major: '',
				others: '',
				school: '',
				otherDescribe: '',
				results: [],
			}
		},
		methods: {
			search() {
				var that = this
				this.$axios.get('http://10.138.125.117:8080/timemaster/getPositionBynameOrCompany/' + this.$route.params.company, )
					.then(function(response) {
						console.log(response.data.data)
						that.results = response.data.data;
					})
			},
			commitJianli() {
				var that = this
				this.$axios.post('http://localhost:8080/timemaster/addResumeMapper', {
					// input2: this.input2,
					numbers: this.numbers,
					email: this.email,
					idcard: this.idcard,
					intentionLocation: this.intentionLocation,
					school: this.school,
					education: this.education,
					major: this.major,
					others: this.others,
					otherDescribe: this.otherDescribe
				}).then(function(response) {
					console.log()
					if (response.data.code == 0) {
						alert("简历提交成功!");
					} else {
						that.$message.error(response.data.msg);
					}
				})
			}
		}
	}
</script>

<style>
	.jc {
		position: absolute;
		top: 650px;
		height: 1000px;
		width: 100$;
		left: 10%;
	}

	.top2 {
		background-color: #550000;
		height: 85px !important;
		position: relative;
		left: -100px;
		width: 120%;
	}

	.el-input__inner {
		border-color: #3A8EE6;
		/*或者 .s2>>>.el-input__inner  */
		background: #fff;
		/*调整inner的背景色，透明*/
		height: 50px;
		/*调整inner的高度*/
		border-radius: 0px !important;
		/*输入框圆角值*/
		border-width: 1px;
	}

	.j1 {
		position: absolute;
		top: 120px !important;
		left: 10%;
	}

	.j2 {
		position: absolute;
		top: 1400px !important;
		left: 10%;
	}

	.j4 {
		position: absolute;
		height: 120px;
		top: 200px !important;
		left: 10%;
	}

	.j41 {
		position: absolute;
		height: 120px;
		top: 750px !important;
		left: 10%;
	}

	.j411 {
		position: absolute;
		height: 120px;
		top: 1200px !important;
		left: 10%;
	}

	.j3 {
		position: absolute;
		height: 120px;
		top: 1400px !important;
		left: 30%;
	}

	.w11 {
		position: absolute !important;
		top: 2000px !important;
		height: 250px;
		width: 120%;
	}

	.el-row11 {
		margin-bottom: 0px;

		&:last-child {
			margin-bottom: 0;
		}
	}

	.el-col11 {
		border-radius: 4px;
	}

	.bg-purple-dark11 {
		background: #99a9bf;
	}

	.bg-purple11 {
		background: darkslategrey;
	}

	.bg-purple-light11 {
		background: #e5e9f2;
	}

	.grid-content11 {
		border-radius: 4px;
		min-height: 36px;
	}

	.row-bg11 {
		padding: 10px 0;
		background-color: #f9fafc;
	}

	.bottom {
		top: 1800px;
		left: 60%;
		position: absolute;
	}

	.el-footer11 {
		height: 200px;
		line-height: 20px;
		position: absolute;
		bottom: 0;
		left: 0;
		width: 85%;
		text-align: center;
		background-color: darkslategrey;
		color: #fff;
		font-family: Arial;
		font-size: 14px;
		letter-spacing: 1px;
	}

	.j5 {
		height: 4px;
		width: 30px;
		background-color: #0055FF;
		position: absolute;
		top: 245px !important;
		left: 10%;
	}

	.j51 {
		height: 4px;
		width: 30px;
		background-color: #0055FF;
		position: absolute;
		top: 795px !important;
		left: 10%;
	}

	.j511 {
		height: 4px;
		width: 30px;
		background-color: #0055FF;
		position: absolute;
		top: 1245px !important;
		left: 10%;
	}

	.j6 {
		position: absolute;
		top: 200px !important;
		left: 30%;
	}

	.j61 {
		position: absolute;
		top: 750px !important;
		left: 30%;
	}

	.j7 {
		color: #7a847e;
		position: absolute;
		top: 270px !important;
		left: 10%;
	}

	.j71 {
		color: #7a847e;
		position: absolute;
		top: 820px !important;
		left: 10%;
	}

	.j8 {
		position: absolute;
		top: 170px !important;
		left: 0%;
		width: 550px !important;
	}

	.j81 {
		position: absolute;
		top: 670px !important;
		left: 0%;
		width: 550px !important;
	}

	.j9 {
		position: absolute;

		top: 300px !important;
		left: 30%;
	}

	.j91 {
		position: absolute;
		top: 850px !important;
		left: 30%;
	}

	.j10 {
		position: absolute;
		top: 350px !important;
		left: 30%;
		width: 550px !important;
	}

	.j101 {
		position: absolute;
		top: 900px !important;
		left: 30%;
		width: 550px !important;
	}

	.j11 {
		position: absolute;
		top: 400px !important;
		left: 30%;
	}

	.j111 {
		position: absolute;
		top: 945px !important;
		left: 30%;
	}

	.j12 {
		position: absolute;
		width: 550px !important;
		top: 450px !important;
		left: 30%;
	}

	.el-select .el-input {
		width: 130px;
	}

	.l1 {
		position: absolute;
		top: 500px !important;
		left: 30%;
	}

	.l11 {
		position: absolute;
		top: 940px !important;
		left: 45%;
	}

	.l2 {
		position: absolute;
		width: 550px !important;
		top: 550px !important;
		left: 30%;
	}

	.l21 {
		position: absolute;
		width: 550px !important;
		top: 1000px !important;
		left: 30%;
	}

	.l211 {
		position: absolute;
		width: 850px !important;
		top: 1300px !important;
		left: 20%;
	}

	.el-select .el-input {
		width: 130px;
	}

	.l3 {
		position: absolute;

		top: 600px !important;
		left: 30%;
	}

	.l31 {
		position: absolute;
		top: 1040px !important;
		left: 30%;
	}

	.l4 {
		position: absolute;
		width: 550px !important;
		top: 650px !important;
		left: 30%;
	}

	.l41 {
		position: absolute;
		width: 550px !important;
		top: 1090px !important;
		left: 30%;
	}

	.l5 {
		position: absolute;
		top: 735px !important;
		left: 10%;
		height: 1px;
		width: 1000px;
		background-color: #c3c3c3;
	}

	.l51 {
		position: absolute;
		top: 1175px !important;
		left: 10%;
		height: 1px;
		width: 1000px;
		background-color: #c3c3c3;
	}

	.l5 {
		position: absolute;
		top: 735px !important;
		left: 10%;
		height: 1px;
		width: 1000px;
		background-color: #c3c3c3;
	}

	.el-upload-dragger {
		height: 200px !important;
		width: 600px !important;
	}
</style>
