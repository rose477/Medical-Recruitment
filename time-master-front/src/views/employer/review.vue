<template>
	<div class="review">
		<h1 class="title">查看简历</h1>
		<div class="reviewoperation">
			<el-row style="padding: 20px;">
				<el-col :span="10">
					<el-input v-model="input" @input="forceUpdate" placeholder="请输入简历的id"></el-input>
				</el-col>
				<el-col :span="6">
					<el-button type="primary" icon="el-icon-search" @click='searchUser'>搜索</el-button>
				</el-col>
			</el-row>
			<el-table stripe border :data="tableData" style="width: 100%">
				<el-table-column prop="id" label="id" width="100">
					
				</el-table-column>
				<el-table-column prop="numbers" label="手机号" width="180">
				</el-table-column>
				<el-table-column prop="email" label="邮箱" width="180">
				</el-table-column>
				<el-table-column prop="idcard" label="身份证号" width="180">
				</el-table-column>
				<el-table-column prop="intentionLocation" label="理想城市" width="100">
				</el-table-column>
				<el-table-column prop="school" label="毕业学校" width="180">
				</el-table-column>
				<el-table-column prop="education" label="学历" width="180">
				</el-table-column>
				<el-table-column prop="major" label="主修" width="180">
				</el-table-column>
				<el-table-column prop="others" label="其他" width="180">
				</el-table-column>
				<el-table-column prop="otherDescribe" label="其他详细描述" width="180">
				</el-table-column>

				<!-- <el-table-column label="操作">
					<template slot-scope="scope">
						<el-button type="primary" @click="updateUser(scope.row)">修改用户</el-button>
						<el-button type="danger" @click="deleteUser(scope.row.id)">删除用户</el-button>
					</template>
				</el-table-column> -->
			</el-table>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				input: '',
				tableData: [],
			}
		},
		mounted() {
			this.requestResume()
		},
		methods: {
			forceUpdate() {
				this.$forceUpdate()
			},
			requestResume() {
				var that = this
				this.$axios.get('http://localhost:8080/timemaster/findresumeByUserId/1')
					.then(function(response) {
						that.tableData = response.data.data
						console.log(response.data.data+'111')
					})
			}
		}
	}
</script>

<style>
	.review {
		background-color: #90EE90;
	}

	.reviewoperation {
		margin-top: 100px !important;
	}
</style>
