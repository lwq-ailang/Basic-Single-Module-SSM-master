package ${basePackage}.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import ${basePackage}.mapper.Mapper;
import ${basePackage}.service.BaseService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import java.io.Serializable;
import java.util.List;

public abstract class BaseServiceImpl<T> implements BaseService<T>{

    //spring 4.x版本之后引入的泛型依赖注入
    @Autowired
    private Mapper<T> mapper;

    @Override
    public T findOne(Serializable id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<T> findAll() {
        return mapper.selectAll();
    }

    @Override
    public List<T> findByWhere(T t) {
        return mapper.select(t);
    }

    @Override
    public PageInfo<T> findPage(Integer page, Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        List<T> list = mapper.selectAll();
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<T> findPage(Integer pageNum, Integer pageSize, T t) {
        PageHelper.startPage(pageNum, pageSize);
        List<T> list = mapper.select(t);
        return new PageInfo<>(list);
    }

    @Override public void add(T t) {
        mapper.insertSelective(t);
    }

    @Override
    public void update(T t) {
        mapper.updateByPrimaryKeySelective(t);
    }

    @Override
    public void deleteByIds(Serializable[] ids) {
        if (ids != null && ids.length > 0) {
            mapper.deleteByIds(StringUtils.join(ids, ","));
        }
    }

}