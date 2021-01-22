<template>
	<div class="homepage-hero-module">
		<Top style='width: 100%; height: 150px; '></Top>
		<div style="display: flex;flex-direction: row;">
			<router-view style="width: 100%; height:100%;  " class="router"></router-view>
		</div>
	</div>
</template>

<script>
	import Top from './employertop.vue'

	export default {
		name: 'App',
		data() {
			return {
				input4: '',
				vedioCanPlay: false,
				fixStyle: ''
			}
		},
		components: {
			Top
		},

		methods: {
			canplay() {
				this.vedioCanPlay = true
			}
		},
		mounted: function() {
			window.onresize = () => {
				const windowWidth = document.body.clientWidth
				const windowHeight = document.body.clientHeight
				const windowAspectRatio = windowHeight / windowWidth
				let videoWidth
				let videoHeight
				if (windowAspectRatio < 0.5625) {
					videoWidth = windowWidth
					videoHeight = videoWidth * 0.5625
					this.fixStyle = {
						height: windowWidth * 0.5625 + 'px',
						width: windowWidth + 'px',
						'margin-bottom': (windowHeight - videoHeight) / 2 + 'px',
						'margin-left': 'initial'
					}
				} else {
					videoHeight = windowHeight
					videoWidth = videoHeight / 0.5625
					this.fixStyle = {
						height: windowHeight + 'px',
						width: windowHeight / 0.5625 + 'px',
						'margin-left': (windowWidth - videoWidth) / 2 + 'px',
						'margin-bottom': 'initial'
					}
				}
			}
			window.onresize()
		}
	}
</script>

<style scoped>
	.top_button {
		font-size: 16px;
		color: #fff !important;
	}

	.top {
		position: absolute;
		z-index: 1000;
		width: 100%;
		height: 100%;
	}

	#nav a {
		font-weight: bold;
		color: #2c3e50;
	}

	#nav a.router-link-exact-active.router-link-active {
		color: #42b983;
	}

	.center {
		z-index: 100;
		position: relative;
		width: 100%;
		margin-top: 30px;
		top: 20%;
	}

	.search {
		z-index: 101;
		width: 470px;
		position: absolute;
		left: 35%;
		top: 50%;
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
		border-radius: 100px;
		/*输入框圆角值*/
		border-width: 1px;
	}


	.el-row {
		margin-bottom: 20px;

		&:last-child {
			margin-bottom: 0;
		}
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

	.el-col {
		border-radius: 4px;

	}

	.sub2 {
		color: #4194f6;
		background: none;
		border-color: #4194f6;
	}

	.sub2:active {
		background: #3a8ee6;
		border-color: #3a8ee6;
		color: #FFF;
	}


	.bg-purple-dark {}

	.bg-purple {}

	.bg-purple-light {}

	.grid-content {
		border-radius: 4px;
		min-height: 36px;
	}

	.row-bg {
		padding: 10px 0;
		background-color: unset;
	}

	.homepage-hero-module {
		.main {
			width: @main-width;
			margin: auto;
		}

		.content-item-block {
			.title {
				font-size: @font-size-larger;
			}
		}
	}

	.router {
		position: absolute;
		top: -10px !important;
	}


	.banner-title {
		color: #fff;
		font-size: 60px;
		position: absolute;
		text-align: center;
		left: 30%;
		top: 25%;
		z-index: 100;
	}

	.subTitle {
		color: #fff;
		font-size: 20px;
		position: relative;
		margin-top: 10px;
		font-size: @font-size-base;
		letter-spacing: 20px;
	}

	.subTitle::after,
	.subTitle::before {
		content: "";
		z-index: 100;
		position: absolute;
		background-image: linear-gradient(270deg,
			hsla(0, 0%, 100%, 0),
			#fff 47%,
			hsla(0, 0%, 100%, 0));
		height: 2px;
		width: 89px;
		top: 50%;
		transform: translateY(-50%);
	}


	.subTitle:before {
		right: 10px;
	}

	.subTitle:after {
		left: 1px;
	}

	.user {
		position: absolute;
		margin-top: 10px;
		color: #FFFFFF;
	}

	.video-container {
		height: 100vh;
		min-height: 400px;
		min-width: @main-width;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		background: rgba(51, 112, 255, 0.2);
		position: relative;

		.video-wrapper {
			font-size: 0;
			position: absolute;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			z-index: -1;
			overflow: hidden;

			.video {
				object-fit: cover;
				width: 100%;
				height: 100%;
			}
		}
	}
</style>
