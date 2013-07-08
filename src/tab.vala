

using Gdl;
using Gtk;
using ValaCAT.FileProject;


namespace ValaCAT.Tabs
{
	/**
	 * Generic tab.
	 */
	[GtkTemplate (ui = "/info/aquelando/valacat/messagelist.ui")]
	public abstract class Tab : Box
	{
		[GtkChild]
		private Dock dock;
		[GtkChild]
		private DockBar dockbar;
		private DockLayout layout_manager;

		public Tab ()
		{
			this.dockbar.master = dock;
			this.layout_manager = new DockLayout(dock);
		}


		public void load_layout (string file)
		{
			this.layout_manager.load_from_file(file);
		}

		public void save_layout (string file)
		{
			this.layout_manager.save_to_file(file);
		}

		public void add_item (DockItem item, DockPlacement place)
		{
			this.dock.add_item(item,place);
		}

	}

	public class FileTab : Tab
	{
		public FileTab (ValaCAT.FileProject.File f)
		{
			base();
		}
	}

	public class ProjectTab : Tab
	{
		public ProjectTab (Project p)
		{
			base();
		}
	}
}