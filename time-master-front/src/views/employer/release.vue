<template>
	<div class="release">
		<h1 class="title">职位发布</h1>
		<div>
			<h3 class="j4">基础信息</h3>
			<div class="j5"></div>
			<h2 class="j2">附件</h2>
			<span class="j7">请填写基本信息</span>
			<h5 class="j9">职位类型(必填)</h5>
			<div class="j10">
				<el-input placeholder="请输入内容" v-model="Jobtype">
				</el-input>
			</div>
			<h5 class="j11">公司名称 (必填)</h5>
			<div class="j12">
				<el-input v-model="company" placeholder="请输入内容"></el-input>
			</div>
			<h5 class="l1">招聘职位(必填)</h5>
			<div class="l2">
				<el-input placeholder="请输入内容" v-model="job">
				</el-input>
			</div>
			<h5 class="l3">公司地址</h5>
			<div class="l4" style="min-width: 500px;">
				<el-input v-model="address" placeholder="请输入公司地址"></el-input>
			</div>
		</div>
		<div class="l5"></div>
		<h3 class="j41">其他信息</h3>
		<div class="j51"></div>
		<span class="j71">请填写以下内容</span>
		<h5 class="j91">薪资水平(必填)</h5>
		<div class="j101">
			<el-input v-model="salary" placeholder="请输入内容"></el-input>
		</div>
		<h5 class="j111">经验要求 (必填)</h5>
		<div class="j121">
		</div>
		<div class="l21">
			<el-input placeholder="请输入内容" v-model="worktime">
			</el-input>
		</div>
		<h5 class="l31">工作时间</h5>
		<div class="l41" style="min-width: 500px;">
			<el-input v-model="input10" placeholder="可以在这里进行补充"></el-input>
		</div>
		<div class="l51"></div>
		<h3 class="j411">其他描述</h3>
		<div class="j511"></div>
		<div class="l211">
			<el-input placeholder="请输入内容" v-model="describes">
			</el-input>
		</div>
		<div class="j3">
			<el-upload class="upload-demo" drag action="https://jsonplaceholder.typicode.com/posts/" multiple>
				<i class="el-icon-upload"></i>
				<div class="el-upload__text">将附件拖到此处，或<em>点击上传</em></div>
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
				<el-button type="primary" @click="commitZhiwei" round>
					发布职位
				</el-button>
			</div>
		</div>
	</div>
</template>

<script>
export default {
		name: 'App2',
		mounted() {
			// this.search();
		},
		data() {
			return {
				results2: '',
				checked: false,
				input: '',
				input2: '',
				company: '',
				job: '',
				Jobtype: '',
				input6: '',
				address: '',
				salary: '',
				worktime: '',
				input10: '',
				input11: '',
				describes: '',
				results: [],
			}
		},
		methods: {
			commitZhiwei(){
				this.$axios.post('http://10.135.189.198:8080/timemaster/addJobs', {
					// input2: this.input2,
					job: this.job,
					company: this.company,
					salary: this.salary,
					Jobtype: this.Jobtype,
					address: this.address,
					worktime: this.worktime,
					describes: this.describes
				}).then(function(response) {
					console.log()
					if (response.data.code == 0) {
						alert("职位增加成功!");
					} else {
						that.$message.error(response.data.msg);
					}
				})
			}
		}
	}
</script>

<style>
	.release {
		background-color: #90EE90;
		height: 1800px !important;
	}

</style>
