<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${basePath}css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${basePath}css/animate.css" />
<link rel="stylesheet" type="text/css" href="${basePath}css/style.css" />
<link rel="stylesheet" type="text/css" href="${basePath}css/skins.css" />

<link rel="stylesheet" type="text/css" href="${basePath}css/ry-ui.css" />
<link rel="stylesheet" type="text/css" href="${basePath}css/wy.css" />

<link rel="shortcut icon"  href="${basePath}img/favicon.ico" type="image/x-icon" >

<!-- <link rel="stylesheet" type="text/css" href="${basePath}css/main/style.min862f.css"/> -->

<!-- ztree -->
<!--
<link rel="stylesheet" type="text/css" href="${basePath}ztree/css/demo.css">
<link rel="stylesheet" type="text/css" href="${basePath}ztree/css/metroStyle/metroStyle.css">
-->

<!-- bootstrap-table -->
<link rel="stylesheet" type="text/css" href="${basePath}ajax/libs/bootstrap-table/bootstrap-table.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}ajax/libs/jquery-layout/jquery.layout-latest.css" />
<link rel="stylesheet" type="text/css" href="${basePath}ajax/libs/layer/theme/default/layer.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}ajax/libs/layer/theme/moon/style.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}ajax/libs/layui/css/modules/laydate/default/laydate.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}js/laydate-v5/theme/default/laydate.css"/>



<style>
	.border{
	  	border:1px dotted red;
	  	height:100%;
	  	/* width:1000px; */
	  }
	  
	  /* 0716 展示所有缩略图的最外侧div */
   	.showImgDivCls{
   		width: 500px;
   		height: 500px;
   		border: 1px solid #DC143C
   	}
   	/* 每个缩略图最外侧的div */
   	.uplThumbnailDiv{		
   		height:150px;
   		width:150px;
   		margin: 5px;
   		float: left;	/* 靠左浮动，后续div都排在右方 然后下方 */
   	}
   	.twoLinkCenter {
   		padding-left:45px;		/* 两个a标签外部有个div,此div没有实现居中，先用div的padding代替 */
   	}
   	/* 缩略图 */
   	.uplThumbnail{
   		margin:5px auto;	/* 与父元素上下边距是5px 左右是居中 */
   		width:100px;		
   		height:100px;
   		border: 1px solid #1c84c6;		/* 边框 */
   		display:block;		/* 独占一行 */
   	}
   	/* 放大图片的模态框 */
    .enlargeVoucherImgModalCls{
        max-width:800px;
        height:auto;
        margin:0px auto;
    }

   	.enlargeContractImgModalCls{
        max-width:800px;
        height:auto;
        margin:0px auto;
   	}


    .enlargeFinanceImgModalCls{
        max-width:800px;
        height:auto;
        margin:0px auto;
    }

   	/* 文档下载的a链接的字体 */
   	.attachACls{
   		font-size : 13px;
   		text-align: center;
   	}
   	
   	td{
   	  text-align:center;
   	}
   	
   	th{
   	  text-align:center;
   	}

    /*设置凭单表格*/

</style>