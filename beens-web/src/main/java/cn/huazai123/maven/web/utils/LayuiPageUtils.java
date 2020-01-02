package cn.huazai123.maven.web.utils;

import com.github.pagehelper.Page;

import cn.huazai123.maven.web.utils.json.LayuiJsonResult;

/**
 * layui分页工具类
 * 
 * @author pyh
 *
 */
public class LayuiPageUtils {
	public static void parsePage(LayuiJsonResult<?> layuiJsonResult, Page<?> pageEntity) {
		layuiJsonResult.setCount(pageEntity.getTotal());
		layuiJsonResult.setPageNum(pageEntity.getPageNum());
		layuiJsonResult.setPageSize(pageEntity.getPageSize());
	}
}
