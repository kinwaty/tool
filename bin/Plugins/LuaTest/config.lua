-- ============================================
-- 窗口配置
-- ============================================
window = {
    Title = "LuaTest",
    Width = 500,
    Height = 400,
    Resizable = true,
    Controls = {
        -- 标签
        {
            Type = "Label",
            Name = "lblTitle",
            Text = "欢迎使用 Lua 配置的窗口",
            X = 20,
            Y = 20,
            Width = 300,
            Height = 30,
            Properties = {
                ForeColor = "#0066CC",
                BackColor = "LightGray",
                FontSize = 14,
                TextAlign = "MiddleCenter",
                Enabled = true,
                Visible = true
            }
        },
        -- 文本框
        {
            Type = "TextBox",
            Name = "txtInput",
            Text = "",
            X = 20,
            Y = 70,
            Width = 300,
            Height = 30,
            Events = {
                TextChanged = "onTextChanged"
            }
        },
        -- 按钮
        {
            Type = "Button",
            Name = "btnSubmit",
            Text = "提交",
            X = 340,
            Y = 70,
            Width = 100,
            Height = 30,
            Events = {
                Click = "onSubmitClick"
            }
        },
        -- 复选框
        {
            Type = "CheckBox",
            Name = "chkOption",
            Text = "启用高级模式",
            X = 20,
            Y = 120,
            Width = 150,
            Height = 25,
            Events = {
                CheckedChanged = "onOptionChanged"
            }
        },
        -- 下拉框
        {
            Type = "ComboBox",
            Name = "cmbSelection",
            X = 20,
            Y = 165,
            Width = 200,
            Height = 25,
            Properties = {
                Items = { "选项一", "选项二", "选项三" },
                DropDownStyle = "DropDownList",           -- 可选，建议设为只读
            },
            Events = {
                SelectedIndexChanged = "onSelectionChanged"
            }
        },
        -- 列表框
        {
            Type = "ListBox",
            Name = "lstHistory",
            X = 20,
            Y = 210,
            Width = 400,
            Height = 120
        },
        -- 单选按钮
        {
            Type = "radiobutton",
            Name = "radioBt1",
            Text = "奇数",
            X = 20,
            Y = 340,
            Width = 100,
            Height = 25,
            Events = {
                CheckedChanged = "onRadio1Changed"
            }
        },
        -- 单选按钮2
        {
            Type = "radiobutton",
            Name = "radioBt2",
            Text = "偶数",
            X = 120,
            Y = 340,
            Width = 100,
            Height = 25,
            Events = {
                CheckedChanged = "onRadio2Changed"
            }
        },
        -- 数字updown
        {
            Type = "numericupdown",
            Name = "numericupdown1",
            X = 20,
            Y = 365,
            Width = 100,
            Height = 25,
            Properties = {
                Min = 0,
                Max = 100,
                DecimalPlaces = 1,
                Value = 2,
            },
        },
        
        -- 日期控件
        {
            Type = "datetimepicker",
            Name = "datetimepicker1",
            X = 20,
            Y = 390,
            Width = 180,
            Height = 25,
            Properties = {
                -- format:Short/Long/Time/Custom
                Format = Time,
                Value = "22:23:30" ,
            },
        },
    }
}

-- ============================================
-- 事件处理函数（由 C# 调用）
-- ============================================

-- 按钮点击事件
function onSubmitClick(sender, e)
    local input = mainForm.Controls["txtInput"].Text
    if input ~= "" then
        local list = mainForm.Controls["lstHistory"]
        list.Items:Add("提交: " .. input)
        mainForm.Controls["txtInput"].Text = ""
    else
        mainForm.Controls["lblTitle"].Text = "请输入内容！"
    end
end

-- 文本变化事件
function onTextChanged(sender, e)
    local len = string.len(sender.Text)
    mainForm.Controls["lblTitle"].Text = "当前输入长度: " .. len
end

-- 复选框变化事件
function onOptionChanged(sender, e)
    if sender.Checked then
        mainForm.Controls["lblTitle"].Text = "高级模式已开启"
    else
        mainForm.Controls["lblTitle"].Text = "高级模式已关闭"
    end
end

-- 下拉框选择事件
function onSelectionChanged(sender, e)
    local idx = sender.SelectedIndex
    if idx >= 0 then
        local items = sender.Items
        mainForm.Controls["lblTitle"].Text = "你选择了: " .. items[idx]
    end
end

-- 窗口加载事件
function onFormLoad(sender, e)
    local cmb = mainForm.Controls["cmbSelection"]
    cmb.SelectedIndex = 0
end

-- 窗口关闭事件
function onFormClosing(sender, e)
    print("窗口正在关闭...")
end


-- 单选框变化事件
function onRadio1Changed(sender, e)
    if sender.Checked then
        mainForm.Controls["lblTitle"].Text = "选择奇数"
        mainForm.Controls["lstHistory"].Width = 50
    end
end

-- 单选框变化事件
function onRadio2Changed(sender, e)
    if sender.Checked then
        mainForm.Controls["lblTitle"].Text = "选择偶数"
        
        mainForm.Controls["lstHistory"].Width = 200
    end
end