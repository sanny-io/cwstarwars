local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	self:SetSize(Clockwork.menu:GetWidth(), Clockwork.menu:GetHeight());
	
	self.panelList = vgui.Create("cwPanelList", self);
 	self.panelList:SetPadding(8);
 	self.panelList:SetSpacing(8);
	self.panelList:StretchToParent(4, 4, 4, 4);
	self.panelList:HideBackground();
	
	self:Rebuild();
end;

-- A function to get whether the button is visible.
function PANEL:IsButtonVisible()
	for k, v in pairs(Clockwork.class.stored) do
		if (Clockwork.kernel:HasObjectAccess(Clockwork.Client, v)) then
			if (Clockwork.plugin:Call("PlayerCanSeeClass", v)) then
				if (Clockwork.Client:Team() != v.index) then
					return true;
				end;
			end;
		end;
	end;
end;

-- A function to rebuild the panel.
function PANEL:Rebuild()
	self.panelList:Clear(true);
	self.classTable = nil;
	
	local available = nil;
	local classes = {};
	
	for k, v in pairs(Clockwork.class.stored) do
		classes[#classes + 1] = v;
	end;
	
	table.sort(classes, function(a, b)
		local aWages = a.wages or 0;
		local bWages = b.wages or 0;
		
		if (aWages == bWages) then
			return a.name < b.name;
		else
			return aWages > bWages;
		end;
	end);
	
	if (#classes > 0) then		
		for k, v in pairs(classes) do
			if (Clockwork.kernel:HasObjectAccess(Clockwork.Client, v)) then
				if (Clockwork.plugin:Call("PlayerCanSeeClass", v)) then
					self.classTable = Clockwork.class.stored[v.name];
					self.panelList:AddItem(vgui.Create("cwClassesItem", self));
				end;
			end;
		end;
	else
		local label = vgui.Create("cwInfoText", self);
			label:SetText("You do not have access to any classes!");
			label:SetInfoColor("red");
		self.panelList:AddItem(label);
	end;
	
	self.panelList:InvalidateLayout(true);
end;

-- Called when the menu is opened.
function PANEL:OnMenuOpened()
	if (Clockwork.menu:IsPanelActive(self)) then
		self:Rebuild();
	end;
end;

-- Called when the panel is selected.
function PANEL:OnSelected() self:Rebuild(); end;

-- Called when the layout should be performed.
function PANEL:PerformLayout(w, h) end;

-- Called when the panel is painted.
function PANEL:Paint(w, h)
	DERMA_SLICED_BG:Draw(0, 0, w, h, 8, COLOR_WHITE);
	
	return true;
end;

-- Called each frame.
function PANEL:Think()
	local team = Clockwork.Client:Team();
	
	if (!self.playerClass) then
		self.playerClass = team;
	end;
	
	if (team != self.playerClass) then
		self.playerClass = team;
		self:Rebuild();
	end;
end;

vgui.Register("cwClasses", PANEL, "EditablePanel");