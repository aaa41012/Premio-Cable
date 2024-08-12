<script setup name="product">
import { ref, computed, watch } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { categories } from './data/categories'
import { onMounted } from 'vue'
const currentImage = ref(1)
const router = useRouter()
const route = useRoute()

const categoryActions = {
  Cables: 1,
  Connectors: 2,
  Handsets: 3
}
// 分類名稱
const currentCategory = computed(() => categories[currentImage.value - 1])
// info 回來的catagroy
const productCategory = ref('')
const goToProductInfo = (id) => {
  router.push({
    name: 'productInfo',
    params: { id, category: currentCategory.value.name }
  })
}
function showImage(imageNumber) {
  currentImage.value = imageNumber
}
onMounted(() => {
  productCategory.value = route.params.category
  console.log('onMounted:', productCategory.value, currentImage.value)
})

watch(
  () => route.params.category,
  (newCategory) => {
    productCategory.value = newCategory
    if (newCategory) {
      currentImage.value = categoryActions[newCategory] || 1
    }
    console.log('Category changed:', productCategory.value, currentImage.value)
  },
  { immediate: true }
)
</script>
<template>
  <div class="product">
    <div class="product">
      <div class="category flex">
        <el-button
          v-for="(category, index) in categories"
          :key="index"
          type="warning"
          class="custom-btn"
          :class="{ active: currentImage === index + 1 }"
          :plain="currentImage !== index + 1"
          @click="showImage(index + 1)"
        >
          {{ category.name }}
        </el-button>
      </div>
    </div>
    <el-breadcrumb separator="/">
      <el-breadcrumb-item to="/">Home</el-breadcrumb-item>
      <el-breadcrumb-item>Product</el-breadcrumb-item>
    </el-breadcrumb>
    <transition name="fade" mode="out-in">
      <div class="product-grid" v-if="currentCategory" :key="currentImage">
        <div class="product-card-wrapper" v-for="item in currentCategory.items" :key="item.id">
          <div class="product-card mail" @click="goToProductInfo(item.id)">
            <div class="product-image">
              <img :src="item.main" class="image" />
            </div>
            <div class="product-info">
              <h3 class="product-title">{{ item.title }}</h3>
              <p class="product-description">{{ item.description }}</p>
            </div>
          </div>
          <div class="more-text">more</div>
        </div>
      </div>
    </transition>
    <el-backtop :right="20" :bottom="60" />
  </div>
</template>

<style scoped lang="scss">
.categroy {
  padding: 0 15%;
  justify-content: space-between;
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active in <2.1.8 */ {
  opacity: 0;
}
.category {
  padding: 0 5%;
  margin-bottom: 20px;
  justify-content: flex-end;
}
.el-breadcrumb {
  padding: 1% 5%;
}
// 卡片
.product-grid {
  display: grid;
  // grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  grid-template-columns: repeat(4, 1fr);
  gap: 50px;
  justify-content: center;
  padding: 5%;
}

.product-card-wrapper {
  overflow: hidden;
  position: relative;
  // border-radius: 8px;
}

.product-card {
  background: #fff;
  border: 1px solid #ddd;
  // border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  position: relative;
  transition: transform 0.3s ease;
}

.product-image {
  overflow: hidden;
  position: relative;
  // 站位
  width: 100%; /* 固定宽度 */
  height: 150px; /* 固定高度 */
  .image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
    transition: transform 0.3s ease;
  }
}

.product-image img {
  width: 100%;
  height: auto;
  transition: transform 0.3s ease;
}

// .product-card:hover .product-image img {
//   transform: scale(1.1);
// }

.product-info {
  padding: 15px;
  transition: transform 0.3s ease;
  .product-title {
    font-weight: 600;
  }
}

.more-text {
  position: absolute;
  bottom: -40px; /* Start below the card */
  left: 0;
  width: 100%;
  background: #f0f0f0;
  color: #000;
  text-align: center;
  padding: 10px;
  cursor: pointer;
  transition: transform 0.3s ease;
  // border-radius: 0 0 8px 8px;
}

.product-card-wrapper:hover .more-text {
  transform: translateY(-40px); /* Move into the card */
}

.product-card-wrapper:hover .product-card {
  border-radius: 0 0 0 0;
  transform: translateY(-40px); /* Move content up */
}
.custom-btn {
  border: none;
  background: #e4e4e4;
  color: #484747;
  &.active {
    color: #fff;
    font-weight: 900;
    background: $main-color;
  }
}
// 最多一行四個
@media (max-width: 1050px) {
  .product-grid {
    grid-template-columns: repeat(3, 1fr);
    gap: 50px;
    padding-bottom: 15%;
  }
}
@media (max-width: 790px) {
  .product-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 50px;
  }
}
@media (max-width: 500px) {
  .product-grid {
    grid-template-columns: 1fr;
    gap: 50px;
  }
}
</style>
