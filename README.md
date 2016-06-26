
# NDTableViewDataSourceAndDelegate
The agent, data from the view controller.Coupling agent, data source with the view controller is reduced, at the same time when the requirements change, add a different type of cell, simple logic to handle a lot.

# Flow Note
![image](https://github.com/indexjincieryi/NDTableViewDataSourceAndDelegate/blob/master/NDTableViewDataSourceAndDelegate/flownote.png)

# Scene
* method
```objc
_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];

_tableView.ndDelegate = [[NDTableViewDelegate alloc] initWithDelegate:(id<UITableViewDelegate>)self tableView:_tableView viewController:self];

NDTableViewDataSource *dataSource = [[NDTableViewDataSource alloc]initWithItems:self.presenter.dataArray tableView:_tableView viewController:self];
dataSource.cellMap = self.presenter.cellMap;///将不同 Cell 映射到字典中，便于后期在dataSourceObject中通过[self nd_cellName:item]此方法获取到类名
_tableView.dataSourceObject = dataSource;///dataSource 动态绑定到 tableView的dataSourceObject
[_tableView bindDataSourceObject];///dataSource作为 tableView的 dataSource,实现 UITableViewDataSource的协议方法
```

# Usage
See the Demo

# More Info
Have a question? Please [open an issue](https://github.com/indexjincieryi/NDTableViewDataSourceAndDelegate/issues)!