<aura:application >
    <ltng:require styles="/resource/SLDS/styles/salesforce-lightning-design-system.css" />
	<button class=".slds-button__icon .slds-is-selected-clicked .slds-not-selected .slds-button_stateful .slds-button__icon_right 	.slds-button__icon_left .slds-button__icon_large">Button</button>
    <button class="slds-button slds-button_icon" label="ltng" press="" />

    <img src="{!$Resource.HMO_Logo}" boarder="black" width="400" height="50"/>
<div align="right">
    <ui:button class="rt" label="Register" press="" />
    <lightning:button class="rt" label="Login" />
</div>
    
</aura:application>