override ARCHS = arm64

NO_TWEAK_RESPRING = 1
FINALPACKAGE = 1
PACKAGE_VERSION = 1.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FLEXInjected
FLEXInjected_FILES = Tweak.xm
FLEXInjected_FILES += temp/FLEXArgumentInputColorView.m temp/FLEXArgumentInputDateView.m temp/FLEXArgumentInputFontsPickerView.m temp/FLEXArgumentInputFontView.m temp/FLEXArgumentInputJSONObjectView.m temp/FLEXArgumentInputNotSupportedView.m temp/FLEXArgumentInputNumberView.m temp/FLEXArgumentInputStringView.m temp/FLEXArgumentInputStructView.m temp/FLEXArgumentInputSwitchView.m temp/FLEXArgumentInputTextView.m temp/FLEXArgumentInputView.m temp/FLEXArgumentInputViewFactory.m temp/FLEXDefaultEditorViewController.m temp/FLEXFieldEditorView.m temp/FLEXFieldEditorViewController.m temp/FLEXIvarEditorViewController.m temp/FLEXMethodCallingViewController.m temp/FLEXPropertyEditorViewController.m temp/FLEXExplorerViewController.m temp/FLEXWindow.m temp/FLEXMultiColumnTableView.m temp/FLEXRealmDatabaseManager.m temp/FLEXSQLiteDatabaseManager.m temp/FLEXTableColumnHeader.m temp/FLEXTableContentCell.m temp/FLEXTableContentViewController.m temp/FLEXTableLeftCell.m temp/FLEXTableListViewController.m temp/FLEXClassesTableViewController.m temp/FLEXCookiesTableViewController.m temp/FLEXFileBrowserFileOperationController.m temp/FLEXFileBrowserSearchOperation.m temp/FLEXFileBrowserTableViewController.m temp/FLEXGlobalsTableViewController.m temp/FLEXInstancesTableViewController.m temp/FLEXLibrariesTableViewController.m temp/FLEXLiveObjectsTableViewController.m temp/FLEXWebViewController.m temp/FLEXSystemLogMessage.m temp/FLEXSystemLogTableViewCell.m temp/FLEXSystemLogTableViewController.m temp/FLEXManager.m temp/FLEXNetworkHistoryTableViewController.m temp/FLEXNetworkRecorder.m temp/FLEXNetworkSettingsTableViewController.m temp/FLEXNetworkTransaction.m temp/FLEXNetworkTransactionDetailTableViewController.m temp/FLEXNetworkTransactionTableViewCell.m temp/FLEXNetworkObserver.m temp/FLEXArrayExplorerViewController.m temp/FLEXClassExplorerViewController.m temp/FLEXDefaultsExplorerViewController.m temp/FLEXDictionaryExplorerViewController.m temp/FLEXGlobalsTableViewControllerEntry.m temp/FLEXImageExplorerViewController.m temp/FLEXLayerExplorerViewController.m temp/FLEXObjectExplorerFactory.m temp/FLEXObjectExplorerViewController.m temp/FLEXSetExplorerViewController.m temp/FLEXViewControllerExplorerViewController.m temp/FLEXViewExplorerViewController.m temp/FLEXExplorerToolbar.m temp/FLEXToolbarItem.m temp/FLEXHeapEnumerator.m temp/FLEXKeyboardHelpViewController.m temp/FLEXKeyboardShortcutManager.m temp/FLEXMultilineTableViewCell.m temp/FLEXResources.m temp/FLEXRuntimeUtility.m temp/FLEXUtility.m temp/FLEXHierarchyTableViewCell.m temp/FLEXHierarchyTableViewController.m temp/FLEXImagePreviewViewController.m temp/FLEXNetworkCurlLogger.m

FLEXInjected_FRAMEWORKS = UIKit CoreGraphics QuartzCore ImageIO CoreFoundation
FLEXInjected_LDFLAGS = -lz -lsqlite3
FLEXInjected_CFLAGS = -fobjc-arc -w


BUNDLE_NAME = FLEXInjectedBundle
FLEXInjectedBundle_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS)/makefiles/bundle.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

# flatten_flex:
# 	cp "`find ./FLEX -name "*.m"`" ./temp/
# 	cp "`find ./FLEX -name "*.h"`" ./temp/

