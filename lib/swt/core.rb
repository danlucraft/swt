module Swt
  import org.eclipse.swt.SWT

  module Widgets
    import org.eclipse.swt.widgets.Button
    import org.eclipse.swt.widgets.Caret
    import org.eclipse.swt.widgets.Combo
    import org.eclipse.swt.widgets.Composite
    import org.eclipse.swt.widgets.Event
    import org.eclipse.swt.widgets.DirectoryDialog
    import org.eclipse.swt.widgets.FileDialog
    import org.eclipse.swt.widgets.List
    import org.eclipse.swt.widgets.Menu
    import org.eclipse.swt.widgets.MenuItem
    import org.eclipse.swt.widgets.MessageBox
    import org.eclipse.swt.widgets.ToolBar
    import org.eclipse.swt.widgets.ToolItem
    import org.eclipse.swt.widgets.CoolBar
    import org.eclipse.swt.widgets.CoolItem
    import org.eclipse.swt.widgets.Sash
    import org.eclipse.swt.widgets.Slider
    import org.eclipse.swt.widgets.TabFolder
    import org.eclipse.swt.widgets.TabItem
    import org.eclipse.swt.widgets.TableColumn
    import org.eclipse.swt.widgets.Text
    import org.eclipse.swt.widgets.ToolTip
    import org.eclipse.swt.widgets.Table
    import org.eclipse.swt.widgets.TableItem
  end

  module Custom
    import org.eclipse.swt.custom.CTabFolder
    import org.eclipse.swt.custom.CTabItem
    import org.eclipse.swt.custom.SashForm
    import org.eclipse.swt.custom.StackLayout
    import org.eclipse.swt.custom.ST
    import org.eclipse.swt.custom.StyleRange
    import org.eclipse.swt.custom.StyledText
    import org.eclipse.swt.custom.TreeEditor
  end

  module DND
    import org.eclipse.swt.dnd.DND

    import org.eclipse.swt.dnd.Transfer
    import org.eclipse.swt.dnd.TextTransfer
    import org.eclipse.swt.dnd.FileTransfer
    import org.eclipse.swt.dnd.ByteArrayTransfer

    import org.eclipse.swt.dnd.DropTarget
    import org.eclipse.swt.dnd.DropTargetEvent
    import org.eclipse.swt.dnd.DropTargetListener

    import org.eclipse.swt.dnd.DragSource
    import org.eclipse.swt.dnd.DragSourceEvent
    import org.eclipse.swt.dnd.DragSourceListener
  end

  module Layout
    import org.eclipse.swt.layout.FillLayout
    import org.eclipse.swt.layout.GridLayout
    import org.eclipse.swt.layout.GridData
    import org.eclipse.swt.layout.RowLayout
    import org.eclipse.swt.layout.RowData
  end

  module Graphics
    import org.eclipse.swt.graphics.Color
    import org.eclipse.swt.graphics.Device
    import org.eclipse.swt.graphics.Font
    import org.eclipse.swt.graphics.GC
    import org.eclipse.swt.graphics.Point
    import org.eclipse.swt.graphics.RGB
  end

  module Events
    import org.eclipse.swt.events.KeyEvent
    import org.eclipse.swt.events.MouseListener
    import org.eclipse.swt.events.MouseTrackListener
    import org.eclipse.swt.events.SelectionListener
    import org.eclipse.swt.events.KeyListener
  end

  import org.eclipse.swt.browser.Browser
  class Browser
    import org.eclipse.swt.browser.BrowserFunction
  end
end
