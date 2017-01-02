module JFace
  Dir[File.expand_path "../../../vendor/jface/*.jar", __FILE__].each do |jar_fn|
    require jar_fn
  end

  module Viewers
    import org.eclipse.jface.viewers.ColumnViewerToolTipSupport
    import org.eclipse.jface.viewers.TreeViewer
    import org.eclipse.jface.viewers.ITreeContentProvider
    import org.eclipse.jface.viewers.ILabelProvider
    import org.eclipse.jface.viewers.ILazyTreeContentProvider
    import org.eclipse.jface.viewers.ILabelProvider
    import org.eclipse.jface.viewers.TextCellEditor
    import org.eclipse.jface.viewers.ViewerDropAdapter
  end

  module Text
    import org.eclipse.jface.text.TextViewerUndoManager
  end

  module Dialogs
    import org.eclipse.jface.dialogs.Dialog
    import org.eclipse.jface.dialogs.InputDialog
  end
end
