<template>
	<div class="out-box">
		<div class="top"></div>
		<transition name="fade" mode="out-in" v-for="(i,f) in picture" :key="f">
			<img :src="i" v-show="f==showNumber">
		</transition>
		<div class="out-icon">
			<div v-for="i in 5" class="icon" :class="{active:(i-1)==showNumber}" @mouseover="mouseOver(i)" @click="btnIcon(i)">
			</div>
		</div>
	</div>
</template>
<script>
	export default {
		data() {
			return {
				timer: "",
				showNumber: 0,
				//表示引入的文件  是一个数组
				picture: [require("../assets/a1.jpg"), require("../assets/a2.jpg"), require("../assets/a3.jpg"),
					require("../assets/a4.jpg"), require("../assets/a5.png")
				]
			}
		},
		mounted() {
			this.times()
		},
		methods: {
			times() {
				this.timer = setInterval(this.changeImg, 3500)
			},
			changeImg() {
				this.showNumber = this.showNumber + 1
				if (this.showNumber == 5) {

					this.showNumber = 0
				}
			},
			btnIcon(i) {
				clearTimeout(this.timer)
				this.showNumber = i - 1
				this.times()
			},
			mouseOver(i) {
				clearTimeout(this.timer)
				this.showNumber = i - 1
				this.times()
			}

		}
	}
</script>

<style scoped>
	.out-box {
		box-sizing: border-box;
		width: 100%;
		height: 350px;
		left: -680px;
		top: 10% !important;
		position: absolute;
	}

	.top {
		background-color: #550000;
		height: 100px;
		width: 100%;
		left: 50%;
		position: absolute;
		top: -20% !important;
	}

	.out-box img {
		width: 100%;
		height: 390px;
		letf: -110% !important;
		position: absolute;
	}

	.fade-enter-active,
	.fade-leave-active {
		transition: all 3.5s;
	}

	.fade-enter,
	.fade-leave-to {
		opacity: 0;
	}

	.icon {
		border-radius: 50%;
		width: 20px;
		background-color: #fff;
		cursor: pointer;
	}

	.out-icon {
		width: 150px;
		height: 20px;
		display: flex;
		justify-content: space-around;
		position: absolute;
		bottom: -10px;
		left: 105%;
	}

	.active {
		background-color: #3064bb;
	}
</style>
