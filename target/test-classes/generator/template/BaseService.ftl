package ${basePackage}.service;

import com.github.pagehelper.PageInfo;
import java.io.Serializable;
import java.util.List;

public interface BaseService<T> {

    /** *根据主键查询
     * @param id 主键
     * @return 实体对象
     */
    T findOne(Serializable id);

    /**
     * 查询全部
     * @return 实体对象集合
     */
    List<T> findAll();

    /**
     * 根据条件查询列表
     * @param t 查询条件对象
     * @return
     */
    List<T> findByWhere(T t);

    /**
     * 分页查询列表
     * @param pageNum 页号
     * @param pageSize 页大小
     * @return 分页信息对象
     */
    PageInfo<T> findPage(Integer pageNum, Integer pageSize);

    /**
     * 根据条件分页查询列表
     * @param pageNum 页号
     * @param pageSize 页大小
     * @param t 查询条件对象
     * @return 分页信息对象
     */
    PageInfo<T> findPage(Integer pageNum, Integer pageSize, T t);

    /**
     * 新增
     * @param t 实体对象
     */
    void add(T t);

    /**
     * 根据主键更新
     * @param t 实体对象
     */
    void update(T t);

    /**
     * 批量删除
     * @param ids 主键集合
     */
    void deleteByIds(Serializable[] ids);

}