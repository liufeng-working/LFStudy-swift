//
//  ViewController.swift
//  SQLite数据库
//
//  Created by 刘丰 on 2017/10/18.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    
    private var db: OpaquePointer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建数据库
        //打开一个指定的数据库，如果不存在则会创建并赋值为参数2，如果存在则会赋值给参数2
        let path = "/Users/liufeng/Desktop/demo.sqlite"
        if sqlite3_open(path, &db) == SQLITE_OK {
            print("打开数据库成功")
            self.createTable()
        }else {
            print("打开数据库失败")
        }
        
        
        //begin transaction 开启事务
        //commit transacton 提交事务
        //rollback transaction 回滚事务
    }
}

extension ViewController {
    private func createTable() {
        let sql = "create table if not exists t_stu(id integer primary key autoincrement, name text not null, age integer, score real default 60)"
        if sqlite3_exec(db!, sql, nil, nil, nil) == SQLITE_OK {
            print("学生表创建成功")
        }else {
            print("学生表创建失败")
        }
    }
    
    
}

