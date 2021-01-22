import Vue from 'vue'
import VueRouter from 'vue-router'

import Login from '../components/Login.vue'
import Admin from '../components/Admin.vue'
import Employee from '../components/Employee.vue'
import Employer from '../components/Employer.vue'

import Account_management from '../views/admin/Account_management.vue'
import Authority_management from '../views/admin/Authority_management.vue'
import CompanyInfo from '../views/admin/CompanyInfo.vue'
import PersonInfo from '../views/admin/PersonInfo.vue'
import NewsInfo from '../views/admin/NewsInfo.vue'
import CollectList from '../views/admin/CollectList.vue'

import job from '../views/employee/job.vue'
import job2 from '../views/employee/job2.vue'
import home from '../views/employee/home.vue'
import work from '../views/employee/work.vue'
import jianli from '../views/employee/jianli.vue'

import employerhome from '../views/employer/employerhome.vue'
import release from '../views/employer/release.vue'
import review from '../views/employer/review.vue'

Vue.use(VueRouter)

const routes = [
	//登录页
	{
		path: '/',
		name: 'Login',
		component: Login
	},

	//管理员界面
	{
		path: '/Admin',
		name: 'Admin',
		component: Admin
	},
	{
		path: '/Account_management',
		name: 'Account_management',
		component: Account_management
	},
	{
		path: '/Authority_management',
		name: 'Authority_management',
		component: Authority_management
	},
	{
		path: '/CompanyInfo',
		name: 'CompanyInfo',
		component: CompanyInfo
	},
	{
		path: '/PersonInfo',
		name: 'PersonInfo',
		component: PersonInfo
	},
	{
		path: '/NewsInfo',
		name: 'NewsInfo',
		component: NewsInfo
	},
	{
		path: '/CollectList',
		name: 'CollectList',
		component: CollectList
	},


	//应聘者界面
	{
		path: '/Employee',
		name: 'Employee',
		component: Employee,
		children: [{
				path: 'job',
				name: 'job',
				component: job
			},
			{
				path: 'job2',
				name: 'job2',
				component: job2
			},
			{
				path: 'home',
				name: 'home',
				component: home
			},
			{
				path: 'work',
				name: 'work',
				component: work
			},
			{
				//简历界面
				path: 'jianli',
				name: 'jianli',
				component: jianli
			}
		],
	},

	//招聘者界面
	{
		path: '/Employer',
		name: 'Employer',
		component: Employer,
		children: [{
			path: 'employerhome',
			name: 'employerhome',
			component: employerhome,
		},
		{
			path: 'release',
			name: 'release',
			component: release,
		},
		{
			//简历界面
			path: 'review',
			name: 'review',
			component: review
		}
		]
	}
]

const router = new VueRouter({
	mode: 'history',
	routes,
})

export default router
