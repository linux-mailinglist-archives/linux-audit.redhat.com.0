Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 782AE109DBA
	for <lists+linux-audit@lfdr.de>; Tue, 26 Nov 2019 13:18:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574770690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dD7/Vl0dRtRFi74ly4f0f/aL8vTFXCWMUoFgYjyaGYo=;
	b=T7VkNBXJ8Y02PmR+PuRgu+OU6AJtwlL054g0oTCvWRbFrLUnyEsxe8tCqta34wVnHGiRRR
	b+gScLxR9Yqpr5Y2+n7myNPtCQztyo19P/ff9F0isNvquj+P2pNcVCdbpM9P504Qn/OLvn
	mWBemegJ4Gj2nYCkxN8ZfBctedyhPQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-7zjpfgjUNoOSh9RN13i_Ag-1; Tue, 26 Nov 2019 07:18:08 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C18C1005512;
	Tue, 26 Nov 2019 12:18:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5AB0608E2;
	Tue, 26 Nov 2019 12:17:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2EB074BB65;
	Tue, 26 Nov 2019 12:17:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAQ5NjH8015536 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Nov 2019 00:23:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E3CC9101A36B; Tue, 26 Nov 2019 05:23:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE5D61008AE1
	for <linux-audit@redhat.com>; Tue, 26 Nov 2019 05:23:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CC128012B9
	for <linux-audit@redhat.com>; Tue, 26 Nov 2019 05:23:43 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140099.outbound.protection.outlook.com [40.107.14.99])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-294-xY_8uASCMT2IakT4UxGhQw-1; Tue, 26 Nov 2019 00:23:39 -0500
Received: from AM0PR07MB4148.eurprd07.prod.outlook.com (52.133.59.151) by
	AM0PR07MB4419.eurprd07.prod.outlook.com (52.133.57.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2495.13; Tue, 26 Nov 2019 05:23:36 +0000
Received: from AM0PR07MB4148.eurprd07.prod.outlook.com
	([fe80::a8b7:80fe:fd07:1497]) by
	AM0PR07MB4148.eurprd07.prod.outlook.com
	([fe80::a8b7:80fe:fd07:1497%4]) with mapi id 15.20.2495.013;
	Tue, 26 Nov 2019 05:23:36 +0000
From: "Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai)"
	<vezhavendan.1.kadirvadivelu.ext@nokia.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: RE: Security audit rules
Thread-Topic: Security audit rules
Thread-Index: AdWWMyZTL2zLwTN+QTK6b84pFG3fdgI9hvaAAAyW0tAAfvZqgABOrEjAAEDYUoAAIQPDUA==
Date: Tue, 26 Nov 2019 05:23:36 +0000
Message-ID: <AM0PR07MB4148A4E598ABB3739AE8B49CB2450@AM0PR07MB4148.eurprd07.prod.outlook.com>
References: <AM0PR07MB414818424612036066D01E9BB27B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
	<2526162.J9WsBpnIYZ@x2>
	<AM0PR07MB41489140C4DD0E0017244C05B24B0@AM0PR07MB4148.eurprd07.prod.outlook.com>
	<2921353.XK4XxU5UnF@x2>
In-Reply-To: <2921353.XK4XxU5UnF@x2>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c712e32c-baed-4ae7-59ac-08d77230c9ce
x-ms-traffictypediagnostic: AM0PR07MB4419:
x-microsoft-antispam-prvs: <AM0PR07MB44199E2214CCB84430ABEA7DB2450@AM0PR07MB4419.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(376002)(346002)(366004)(39860400002)(13464003)(189003)(199004)(55016002)(4326008)(86362001)(74316002)(14454004)(446003)(11346002)(966005)(76176011)(478600001)(186003)(7696005)(102836004)(25786009)(15650500001)(6916009)(26005)(305945005)(6116002)(6506007)(53546011)(3846002)(6246003)(7116003)(5660300002)(229853002)(7736002)(450100002)(9686003)(66066001)(6306002)(6436002)(316002)(66946007)(2906002)(66556008)(64756008)(66446008)(66476007)(76116006)(52536014)(3480700005)(54906003)(14444005)(256004)(8676002)(71190400001)(71200400001)(99286004)(8936002)(81166006)(81156014)(33656002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR07MB4419;
	H:AM0PR07MB4148.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8y31GosP5O9naZnQmldGoNycQmi/uHp/ENqettT9pAgWF0PddbJPZfqm6Ty8uunsE44Mxu/MqGip5okVzJ+TJr2FmGdFzsKUzpfxo1AUcEYgLpgxnVooIfT7MxEELTIiyn0Q5Xhx20PuLN17Ay4RBDizRiJosQy9mNmNVKPzsyAWfH7M/Sx6slScve2EVETpzf2tfLPMmkSAx72AuSA8P0GwpU7/VmUOBrIcVoN6MhbOEhRpG3NxPDtKUrk7YoAAAFAC1yeSIO7/Tt4sOvsdvFWgnjGoVW7DYZkjpV5iAR1IJmzBxBCuLGIWgwihPe9gduwd4mJELTAF2mH42f4+hM10bzgVt6cApQaF/wXJPIdjBv8aO4G2S3abroy4JkONxPYNHQGWbxTwsbYwk44dwEkfTMQIpHJnavosiWLgIchui/jkK79xI8244TTb0WOsD+ofyyW8J7tooC5Nt/zzyBXQ+GleiHVVpKYDoBlDVP8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c712e32c-baed-4ae7-59ac-08d77230c9ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 05:23:36.5065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +eBrvdztHsljFEdWNFhdejIGam5wIcgm+2PVrTaE1fSG3SgW7oxQaOpiqv5qj60CeGczmCrNeu2tsb9NKt5fhJCETpGQtJHaaG8BNy2NSXIACv4pO2b8H+hCUR8baPU1QghQV2Rrimujxx2+Dn1r0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4419
X-MC-Unique: xY_8uASCMT2IakT4UxGhQw-1
X-MC-Unique: 7zjpfgjUNoOSh9RN13i_Ag-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAQ5NjH8015536
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 26 Nov 2019 07:17:37 -0500
Cc: Richard Guy Briggs <rgb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks Steve. That explains.

Regards,
Vezhavendan K

-----Original Message-----
From: Steve Grubb <sgrubb@redhat.com> 
Sent: Monday, November 25, 2019 7:08 PM
To: Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai) <vezhavendan.1.kadirvadivelu.ext@nokia.com>
Cc: linux-audit@redhat.com; Richard Guy Briggs <rgb@redhat.com>
Subject: Re: Security audit rules

On Sunday, November 24, 2019 1:44:03 AM EST Kadirvadivelu, Vezhavendan 1. 
(EXT - IN/Chennai) wrote:
> That's clear on the rules. Thanks for that, but my question is where 
> should I place the file called 'audit.rules'. It should be under 
> '/etc/audit' or '/etc/audit/rules.d' or in both places.

Nowhere. audit.rules is built by augenrules using the sorting method described in the man page for it. Again, there is a README-rules file that explains how this works. If you have specific things that you would like to add, then make a file for it and place it in /etc/audit/rules.d where it will get combined with other rule files. README-rules gives suggestions about how to name the file for predictable inclusion.

-Steve


> -----Original Message-----
> From: Steve Grubb <sgrubb@redhat.com>
> Sent: Friday, November 22, 2019 10:39 PM
> To: linux-audit@redhat.com
> Cc: Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai) 
> <vezhavendan.1.kadirvadivelu.ext@nokia.com>; Richard Guy Briggs 
> <rgb@redhat.com> Subject: Re: Security audit rules
> 
> On Tuesday, November 19, 2019 11:36:38 PM EST Kadirvadivelu, Vezhavendan 1.
> (EXT - IN/Chennai) wrote:
> > I am using RHEL7.6 version (Red Hat Enterprise Linux 7 (Maipo)).
> 
> This distribution wants rules placed in /etc/audit/rules.d/ The audit 
> package should have a file named README-rules that explains what is 
> expected.
> 
> -Steve
> 
> > -----Original Message-----
> > From: Richard Guy Briggs <rgb@redhat.com>
> > Sent: Wednesday, November 20, 2019 4:03 AM
> > To: Kadirvadivelu, Vezhavendan 1. (EXT - IN/Chennai) 
> > <vezhavendan.1.kadirvadivelu.ext@nokia.com> Cc: 
> > linux-audit@redhat.com
> > Subject: Re: Security audit rules
> > 
> > On 2019-11-08 12:52, Kadirvadivelu, Vezhavendan 1. (EXT - 
> > IN/Chennai)
> 
> wrote:
> > > Hi,
> > > 
> > > In one of the VM I find audit.rules defined under /etc/audit as 
> > > well as /etc/audit/rules.d.
> > > 
> > > What is the significance as well as difference between the files 
> > > found in
> > > 2 places.
> > 
> > You haven't said what distro you are using.  In more recent distros, 
> > the rules in rules.d are used by augenrules to populate audit.rules, 
> > overwriting them.
> > 
> > > Also please let me know what is the correct location where 
> > > audit.rules need to be places.
> > 
> > Depends on your distro.
> > 
> > > Vezhavendan K
> > 
> > - RGB
> > 
> > --
> > Richard Guy Briggs <rgb@redhat.com>
> > Sr. S/W Engineer, Kernel Security, Base Operating Systems Remote, 
> > Ottawa, Red Hat Canada IRC: rgb, SunRaycer
> > Voice: +1.647.777.2635, Internal: (81) 32635
> > 
> > 
> > --
> > Linux-audit mailing list
> > Linux-audit@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-audit





--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

