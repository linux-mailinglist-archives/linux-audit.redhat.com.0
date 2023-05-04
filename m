Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D66F6E0F
	for <lists+linux-audit@lfdr.de>; Thu,  4 May 2023 16:51:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683211885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=jY5ED24riMMGBzLlY++eoMpD7/hRSrUAwYGOXiJC6aM=;
	b=Ii2qxSAzWmxXVBVMnPeOHiTTKgnfpA8fMDBTf2Y+qovZtwNjoT/SjZmC3O5xBvwCQVUkeb
	z7G/CFsEu6e/jJ2ludR1erncs4wrQTE4d+ioUjQUtjOrMoEpE91x8VaYdBWtwhFMEl3nyV
	LizTGXk7R/+o96NdnGiVaNceNhOTUS8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-Jswbi83eMceA3MaH1eRMlg-1; Thu, 04 May 2023 10:51:21 -0400
X-MC-Unique: Jswbi83eMceA3MaH1eRMlg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A981858289;
	Thu,  4 May 2023 14:51:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11196492C13;
	Thu,  4 May 2023 14:51:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A7B6B1946A4A;
	Thu,  4 May 2023 14:51:10 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5FBA819465BB for <linux-audit@listman.corp.redhat.com>;
 Thu,  4 May 2023 14:51:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 513C4C15BAE; Thu,  4 May 2023 14:51:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48404C15BAD
 for <linux-audit@redhat.com>; Thu,  4 May 2023 14:51:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 248AC87B2A4
 for <linux-audit@redhat.com>; Thu,  4 May 2023 14:51:09 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2100.outbound.protection.outlook.com [40.107.244.100]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-T1Ny1XlUMWOpqGXHXnW13w-1; Thu, 04 May 2023 10:51:06 -0400
X-MC-Unique: T1Ny1XlUMWOpqGXHXnW13w-1
Received: from BYAPR01MB4776.prod.exchangelabs.com (2603:10b6:a03:84::13) by
 BN6PR01MB2401.prod.exchangelabs.com (2603:10b6:404:52::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22; Thu, 4 May 2023 14:51:02 +0000
Received: from BYAPR01MB4776.prod.exchangelabs.com
 ([fe80::5b30:d76c:e256:b0ae]) by BYAPR01MB4776.prod.exchangelabs.com
 ([fe80::5b30:d76c:e256:b0ae%5]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 14:51:01 +0000
From: =?iso-8859-2?Q?J=F3=BCwiak=2C_Jaros=B3aw?=
 <jjozwiak@catalogicsoftware.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: The directory removing loses a fraction of path.
Thread-Topic: The directory removing loses a fraction of path.
Thread-Index: AQHZfpSh9au+SpPWMEm/YD3BfeiubA==
Date: Thu, 4 May 2023 14:51:01 +0000
Message-ID: <BYAPR01MB477677C98795C466C6DD436AC26D9@BYAPR01MB4776.prod.exchangelabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR01MB4776:EE_|BN6PR01MB2401:EE_
x-ms-office365-filtering-correlation-id: e7d3810a-8f34-4a01-a186-08db4caefa8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: n4c1aYElXCkHyFwRVm7TEaVuvV8QkzYdlxIR6DrwnRnE08LBJiXWBNzsgHpZwc5mkvOTrtrQPBQisYVeboQ85U8h9G142VXFch2BzJHd24+hBWczWXIflVmyV6fKQP0Tc3TXl+GvWQT3t95Xstk/D63RTc4f+/QNeAQW63AqEyUDam/XajCClIG3ITYtHMCBqHhX2ImxCqbk9orBYlpTDh86oNfK7Zqhhq2MlusPKYo1hbCpsPMPkKk1JcGQ+8gLJKGOk9JN/1Pl0Yg966cqOsgw0gfySNBOEkbBAp9knX/RBKUJRKKiXB+4Uszf7LGARA/auXzV4R8gTPSAUeJO1FXEBgThpEcqFFbiYZAtv1O81BbGzloaxsVTayVYzugesVFuNkI4dv9w3IV6iT/duroCa/GfVsx68UWelwOXn7z+794J10VLhDUUjs+LCF0NhLTtM5XLFPS10r6d0Ua8lkmM4PSSTlZc0LIXzoxcZJcXb2vptxDwa81/La5qBdoQM+VWOviYQgu+x4z8hB9/xKH1bmpCh/RdgJzh80I7X37s9OLMZvdysX10kpbexcBtb5eru97lG/IKP64aV1XwNNsC04wg9BPSEnjAKv3nj4E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4776.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39830400003)(451199021)(19627405001)(66556008)(2906002)(5660300002)(8676002)(8936002)(33656002)(91956017)(66476007)(76116006)(52536014)(66946007)(71200400001)(478600001)(86362001)(55016003)(966005)(316002)(64756008)(66446008)(6916009)(41300700001)(7696005)(38070700005)(122000001)(38100700002)(83380400001)(186003)(9686003)(6506007)(26005);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?uOWPnOb2PtT+atYkPccBh2UGlQLYrfIf7ymvUq4TW6DQm9YMFJDLB72VM2?=
 =?iso-8859-2?Q?WNhZPClqxY4XcwpGaedYfiT2fb6mDM2hwoaplgLX/fR7z2MxP1SpP+CMhn?=
 =?iso-8859-2?Q?yrF+pUzh+HUxgiIzLrbdbGlIrSzecSn+fzBeY1gS5IBs5GWx4XSfXLgGT0?=
 =?iso-8859-2?Q?SoVJiUzIGEZjEYZD2nQfm10JV39Yx0q5c2Q/yf9x3DKFZlWGHxj+HZAgHQ?=
 =?iso-8859-2?Q?840YX9IBZBlBSuF8SP0+Y24/xHqwRj2vNFYapEWbF3e98YDd9CK9+LY/5a?=
 =?iso-8859-2?Q?qR1DI2WHrynOMe+h8U6a3CfCc/MSoj3ZXI+fmc5YRcFmN7OdIhliM4fEx5?=
 =?iso-8859-2?Q?0RhZgpKAfaYYT+VsqBUa9ELrJUiKrXgRwv5iIavHNRcoBQxtxfwv/jB7SG?=
 =?iso-8859-2?Q?oPBUOZWEXaR0VcEuZe9hyHszvjyWNNANbGmRf9uWajzlYLipjVYbq5gSSi?=
 =?iso-8859-2?Q?BTAo2BNeOTO769+e4Wu9Dh1xbpy5tZHgcf3hm+kC5YD4cT+HSs9RnCVDqp?=
 =?iso-8859-2?Q?p0gEmnTTaxLey8E1fIp/Sb2iZ8KXwMOPu0V+NXPhbQIzjgVzE1WeonCgtM?=
 =?iso-8859-2?Q?HD52Wq89PNccPbmX9QsIydMnKC08KxCcACIsZMu/6hZ5oF8HQSA79UolUI?=
 =?iso-8859-2?Q?IWt4oQnV+UyqjlHrId1vDi+NSyVt4htibHIpVfbmJD/lTtCqV0IWu1TJFq?=
 =?iso-8859-2?Q?CShQovU0Oel4ipEsOlLge/7h8NLTwv7BHUUTxfKMfVbJ47PnLHGOdNiZxN?=
 =?iso-8859-2?Q?lhswOPb2ysDsj4j0a+3aWW5MgHhcavaHIP9ntYbJobojiYG6khvU1hnYpa?=
 =?iso-8859-2?Q?KOVWN2PgTImys/LaLJSP7DPtvMuxFNpNwY1ZZz4iz03l2vBGvtDE9qp4LX?=
 =?iso-8859-2?Q?GTO+N2dYu53DrS820kB4XdyaW7zRz01gslCWeiSRfzmgq3WhHanbDUV3j5?=
 =?iso-8859-2?Q?rnSVqPSLc6M81h2WnXCcOtN3P7L+lXRozQ8R1N5AkL5xbUWRe0RmlfFhyf?=
 =?iso-8859-2?Q?3AQHiy4glfeiZ2bW+8evkADz+mYgRVtPTOQJgIlEz7v/gINGms/QJt+GTN?=
 =?iso-8859-2?Q?t0JBpLEXbfZ2CC0mPVw3UseXp2iOMrduu4WvLi7ry+Mrq5OP+yyxRSq5ig?=
 =?iso-8859-2?Q?lWMHxvU7HKgS811glza0DQFnfvy1w45ALBBVe5zHgdzo+nSmp2n38bhDPl?=
 =?iso-8859-2?Q?FfhgnwPo7GYCMUXOkFtsx+T5YvKF/9Q1VQoVtHDqhrwJx3zbhh/NpYgCEw?=
 =?iso-8859-2?Q?Cz7OIZKqeB2swilUqAfvjwEiNXcFR0ViUWYAR7ZOj11NTlw6bvaW1m9OBh?=
 =?iso-8859-2?Q?0k/ig34UWwyl4n8yMknQGE1bj6v4hG302CMXTosPq86RqV1gMPjhBGUmI1?=
 =?iso-8859-2?Q?wPVhYcwUwsxq3YTAtZQT1oSWnBqwgD+GlKKvRGyV25Blap0chO4dgJN6Sb?=
 =?iso-8859-2?Q?U5921fuDAgHapjfVnaXdr3DOpSFh2MH8uqF1zxortzz9CJhkkIXyErMWug?=
 =?iso-8859-2?Q?zpxXSsYGiFCNhDV1gHeoaX1dkqvdc2fo3tjv/HhMTQMBi9y6VwS5q9pKM1?=
 =?iso-8859-2?Q?w/rBOazCol41srXFJFMt9A6N2CA2vUZsrfRA6KLTSLj7ugD68DPHirvdq7?=
 =?iso-8859-2?Q?4RbpUNjSjwWoEs1r4ghcDkigCgyPncWvCVIggx1cbDNOu6KV0QGxGRyg?=
 =?iso-8859-2?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: catalogicsoftware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4776.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d3810a-8f34-4a01-a186-08db4caefa8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 14:51:01.4533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ea3d63e8-dd40-410b-9496-d2ee49ccddc3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NakM2gPcnz3KgTqBQJYT+K2GdD1QtfshCwlwqUMwsmL+ku73f6wuqEO8R6avWNyC+mSP0LHoYBhCdmPtGs8qql+WYUT8BNb4WGtrWcfytQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2401
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: catalogicsoftware.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============5116898663480315153=="

--===============5116898663480315153==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BYAPR01MB477677C98795C466C6DD436AC26D9BYAPR01MB4776prod_"

--_000_BYAPR01MB477677C98795C466C6DD436AC26D9BYAPR01MB4776prod_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi,

this issue has been already reported by me at github linux-audit / audit-us=
erspace issues site, but Steve Grubb suggested to write here to report the =
issue to the kernel part developers.

Just in case original thread You can find under this link:

https://github.com/linux-audit/audit-userspace/issues/298

entitled:

The directory removing loses a fraction of path.


Problem description.

(Slightly changed regarding to the original thread.)

When deleting a directory, there is not enough information in the 'audit.lo=
g' file to reconstruct the full path to the deleted file as well as to the =
deleted directory.

When the following sequence of commands is run in bash, we get the informat=
ion presented below in the 'audit.log' file. Apart from two cases, all othe=
rs do not allow to reconstruct the full path from records 'CWD' and 'PATH'.

----
command sequence
----

# cd /root

# mkdir -p /root/dir1/dir2/dir3 ; echo file1 > /root/dir1/dir2/dir3/file1
# rm -rf dir1/dir2
# ausearch -i -ts 02/20/2023 09:37:00 -te 02/20/2023 09:38:00 > relative_wi=
thout_trailing_slash.txt

# mkdir -p /root/dir1/dir2/dir3 ; echo file1 > /root/dir1/dir2/dir3/file1
# rm -rf dir1/dir2/
# ausearch -i -ts 02/20/2023 09:38:00 -te 02/20/2023 09:39:00 > relative_wi=
th_trailing_slash.txt

# mkdir -p /root/dir1/dir2/dir3 ; echo file1 > /root/dir1/dir2/dir3/file1
# rm -rf /root/dir1/dir2/
# ausearch -i -ts 02/20/2023 09:39:00 -te 02/20/2023 09:40:00 > absolute_wi=
th_trailing_slash.txt

# mkdir -p /root/dir1/dir2/dir3 ; echo file1 > /root/dir1/dir2/dir3/file1
# rm -rf /root/dir1/dir2
# ausearch -i -ts 02/20/2023 09:40:00 -te 02/20/2023 09:41:00 > absolute_wi=
thout_trailing_slash.txt

----
results
----

----
# cat relative_without_trailing_slash.txt # (edited)
----
type=3DPROCTITLE : proctitle=3Drm -i -rf dir1/dir2
type=3DPATH : item=3D1 name=3Dfile1 nametype=3DDELETE
type=3DPATH : item=3D0 name=3D/root nametype=3DPARENT
type=3DCWD : cwd=3D/root
----
type=3DPROCTITLE : proctitle=3Drm -i -rf dir1/dir2
type=3DPATH : item=3D1 name=3Ddir3 nametype=3DDELETE
type=3DPATH : item=3D0 name=3D/root nametype=3DPARENT
type=3DCWD : cwd=3D/root
----
type=3DPROCTITLE : proctitle=3Drm -i -rf dir1/dir2
type=3DPATH : item=3D1 name=3Ddir1/dir2 nametype=3DDELETE
type=3DPATH : item=3D0 name=3Ddir1/ nametype=3DPARENT
type=3DCWD : cwd=3D/root
----

----
# cat relative_with_trailing_slash.txt # (edited)
----
type=3DPROCTITLE : proctitle=3Drm -i -rf dir1/dir2/
type=3DPATH : item=3D1 name=3Dfile1 nametype=3DDELETE
type=3DPATH : item=3D0 name=3D/root nametype=3DPARENT
type=3DCWD : cwd=3D/root
----
type=3DPROCTITLE : proctitle=3Drm -i -rf dir1/dir2/
type=3DPATH : item=3D1 name=3Ddir3 nametype=3DDELETE
type=3DPATH : item=3D0 name=3D/root nametype=3DPARENT
type=3DCWD : cwd=3D/root
----
type=3DPROCTITLE : proctitle=3Drm -i -rf dir1/dir2/
type=3DPATH : item=3D2 name=3D(null) nametype=3DDELETE
type=3DPATH : item=3D1 name=3D(null) nametype=3DPARENT
type=3DPATH : item=3D0 name=3Ddir1/ nametype=3DPARENT
type=3DCWD : cwd=3D/root
----

----
# cat absolute_with_trailing_slash.txt # (edited)
----
type=3DPROCTITLE : proctitle=3Drm -i -rf /root/dir1/dir2/
type=3DPATH : item=3D1 name=3Dfile1 nametype=3DDELETE
type=3DPATH : item=3D0 name=3D/root nametype=3DPARENT
type=3DCWD : cwd=3D/root
----
type=3DPROCTITLE : proctitle=3Drm -i -rf /root/dir1/dir2/
type=3DPATH : item=3D1 name=3Ddir3 nametype=3DDELETE
type=3DPATH : item=3D0 name=3D/root nametype=3DPARENT
type=3DCWD : cwd=3D/root
----
type=3DPROCTITLE : proctitle=3Drm -i -rf /root/dir1/dir2/
type=3DPATH : item=3D2 name=3D(null) nametype=3DDELETE
type=3DPATH : item=3D1 name=3D(null) nametype=3DPARENT
type=3DPATH : item=3D0 name=3D/root/dir1/ nametype=3DPARENT
type=3DCWD : cwd=3D/root
----

----
# cat absolute_without_trailing_slash.txt # (edited)
----
type=3DPROCTITLE : proctitle=3Drm -i -rf /root/dir1/dir2
type=3DPATH : item=3D1 name=3Dfile1 nametype=3DDELETE
type=3DPATH : item=3D0 name=3D/root nametype=3DPARENT
type=3DCWD : cwd=3D/root
----
type=3DPROCTITLE : proctitle=3Drm -i -rf /root/dir1/dir2
type=3DPATH : item=3D1 name=3Ddir3 nametype=3DDELETE
type=3DPATH : item=3D0 name=3D/root nametype=3DPARENT
type=3DCWD : cwd=3D/root
----
type=3DPROCTITLE : proctitle=3Drm -i -rf /root/dir1/dir2
type=3DPATH : item=3D1 name=3D/root/dir1/dir2 nametype=3DDELETE
type=3DPATH : item=3D0 name=3D/root/dir1/ nametype=3DPARENT
type=3DCWD : cwd=3D/root
----

Tested on

RedHat 9.0, Alma 9.0
kernel - 5.14.0-70.13.1.el9_0.x86_6
packages - audit.x86_64, audit-libs.x86_64 - 3.0.7-103.el9

RedHat 8.6, Alma 8.6
kernel - 4.18.0-372.9.1.el8.x86_64
packages - audit.x86_64, audit-libs.x86_64 - 3.0.7-4.el8

RedHat 7.9, Centos 7.9
kernel - 3.10.0-1160.80.1.el7.x86_64
packages - audit.x86_64, audit-libs.x86_64 - 2.8.5-4.el7

Ubuntu 22.04.2
kernel - 5.15.0-60-generic
packages - auditd, libaudit-common, libaudit-dev:amd64, libaudit1:amd64 -1:=
3.0.7-1build1

----

Configuration files on RedHat 9.0

----
/etc/audit/audit.rules
----

-D
-b 8192
-f 1
-w / -p w -k TEST
--backlog_wait_time 60000

----
/etc/audit/auditd.conf
----

local_events =3D yes
write_logs =3D yes
log_file =3D /var/log/audit/audit.log
log_group =3D root
log_format =3D ENRICHED
flush =3D INCREMENTAL_ASYNC
freq =3D 50
max_log_file =3D 8
num_logs =3D 5
priority_boost =3D 4
name_format =3D NONE
##name =3D mydomain
max_log_file_action =3D ROTATE
space_left =3D 75
space_left_action =3D SYSLOG
verify_email =3D yes
action_mail_acct =3D root
admin_space_left =3D 50
admin_space_left_action =3D SUSPEND
disk_full_action =3D SUSPEND
disk_error_action =3D SUSPEND
use_libwrap =3D yes
##tcp_listen_port =3D 60
tcp_listen_queue =3D 5
tcp_max_per_addr =3D 1
##tcp_client_ports =3D 1024-65535
tcp_client_max_idle =3D 0
transport =3D TCP
krb5_principal =3D auditd
##krb5_key_file =3D /etc/audit/audit.key
distribute_network =3D no
q_depth =3D 1200
overflow_action =3D SYSLOG
max_restarts =3D 10
plugin_dir =3D /etc/audit/plugins.d
end_of_event_timeout =3D 2

----
----

As suggested by Steve, I checked also the following rules independently ins=
tead of '-w / -p w -k TEST'.

-a always,exit -F arch=3Db64 -F dir=3D/root/dir1/dir2/dir3/ -k TEST
-a always,exit -F arch=3Db64 -F path=3D/root/dir1/dir2/dir3/file1 -k TEST
-a always,exit -F arch=3Db64 -S unlinkat -k TEST

And I always get the same results like in watch '-w / -p w' case. There is =
still not enough information in the 'audit.log' file to reconstruct the ful=
l path to the deleted file.

On the other hand, the goal is to monitor events across the file system. Th=
ere is no way to predict what will be deleted. Therefore, applying rules to=
 specific directories and files seems to be the wrong way to go.

----
/Jarek.
jjozwiak (at) catalogicsoftware.com

--_000_BYAPR01MB477677C98795C466C6DD436AC26D9BYAPR01MB4776prod_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0 elementToProof">this issue has been already re=
ported by me at github linux-audit / audit-userspace issues site, but Steve=
 Grubb suggested to write here
<span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=
=3D"ryNqvb ContentPasted2">to report the issue to the kernel part developer=
s.</span></span></span><br>
</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0 elementToProof">Just in case original thread Y=
ou can find under this link:</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">https://github.com/linux-audit/audit-userspac=
e/issues/298</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">entitled:</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">The directory removing loses a fraction of pa=
th.</div>
<div><br class=3D"ContentPasted0">
</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Problem description.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">(Slightly changed regarding to the original t=
hread.)</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">When deleting a directory, there is not enoug=
h information in the 'audit.log' file to reconstruct the full path to the d=
eleted file as well as to the deleted directory.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">When the following sequence of commands is ru=
n in bash, we get the information presented below in the 'audit.log' file. =
Apart from two cases, all others do not allow to reconstruct the full path =
from records 'CWD' and 'PATH'.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">command sequence</div>
<div class=3D"ContentPasted0">----</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0"># cd /root</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0"># mkdir -p /root/dir1/dir2/dir3 ; echo file1 =
&gt; /root/dir1/dir2/dir3/file1</div>
<div class=3D"ContentPasted0"># rm -rf dir1/dir2</div>
<div class=3D"ContentPasted0"># ausearch -i -ts 02/20/2023 09:37:00 -te 02/=
20/2023 09:38:00 &gt; relative_without_trailing_slash.txt</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0"># mkdir -p /root/dir1/dir2/dir3 ; echo file1 =
&gt; /root/dir1/dir2/dir3/file1</div>
<div class=3D"ContentPasted0"># rm -rf dir1/dir2/</div>
<div class=3D"ContentPasted0"># ausearch -i -ts 02/20/2023 09:38:00 -te 02/=
20/2023 09:39:00 &gt; relative_with_trailing_slash.txt</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0"># mkdir -p /root/dir1/dir2/dir3 ; echo file1 =
&gt; /root/dir1/dir2/dir3/file1</div>
<div class=3D"ContentPasted0"># rm -rf /root/dir1/dir2/</div>
<div class=3D"ContentPasted0"># ausearch -i -ts 02/20/2023 09:39:00 -te 02/=
20/2023 09:40:00 &gt; absolute_with_trailing_slash.txt</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0"># mkdir -p /root/dir1/dir2/dir3 ; echo file1 =
&gt; /root/dir1/dir2/dir3/file1</div>
<div class=3D"ContentPasted0"># rm -rf /root/dir1/dir2</div>
<div class=3D"ContentPasted0"># ausearch -i -ts 02/20/2023 09:40:00 -te 02/=
20/2023 09:41:00 &gt; absolute_without_trailing_slash.txt</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">results</div>
<div class=3D"ContentPasted0">----</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0"># cat relative_without_trailing_slash.txt # (=
edited)</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf dir1=
/dir2</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3Dfile1 nametype=
=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3D/root nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf dir1=
/dir2</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3Ddir3 nametype=
=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3D/root nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf dir1=
/dir2</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3Ddir1/dir2 namet=
ype=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3Ddir1/ nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0"># cat relative_with_trailing_slash.txt # (edi=
ted)</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf dir1=
/dir2/</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3Dfile1 nametype=
=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3D/root nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf dir1=
/dir2/</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3Ddir3 nametype=
=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3D/root nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf dir1=
/dir2/</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D2 name=3D(null) nametype=
=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3D(null) nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3Ddir1/ nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0"># cat absolute_with_trailing_slash.txt # (edi=
ted)</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf /roo=
t/dir1/dir2/</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3Dfile1 nametype=
=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3D/root nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf /roo=
t/dir1/dir2/</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3Ddir3 nametype=
=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3D/root nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf /roo=
t/dir1/dir2/</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D2 name=3D(null) nametype=
=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3D(null) nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3D/root/dir1/ nam=
etype=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0 elementToProof"># cat absolute_without_trailin=
g_slash.txt # (edited)</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf /roo=
t/dir1/dir2</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3Dfile1 nametype=
=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3D/root nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf /roo=
t/dir1/dir2</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3Ddir3 nametype=
=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3D/root nametype=
=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">type=3DPROCTITLE : proctitle=3Drm -i -rf /roo=
t/dir1/dir2</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D1 name=3D/root/dir1/dir2=
 nametype=3DDELETE</div>
<div class=3D"ContentPasted0">type=3DPATH : item=3D0 name=3D/root/dir1/ nam=
etype=3DPARENT</div>
<div class=3D"ContentPasted0">type=3DCWD : cwd=3D/root</div>
<div class=3D"ContentPasted0">----</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Tested on</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">RedHat 9.0, Alma 9.0</div>
<div class=3D"ContentPasted0">kernel - 5.14.0-70.13.1.el9_0.x86_6</div>
<div class=3D"ContentPasted0">packages - audit.x86_64, audit-libs.x86_64 - =
3.0.7-103.el9</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">RedHat 8.6, Alma 8.6</div>
<div class=3D"ContentPasted0">kernel - 4.18.0-372.9.1.el8.x86_64</div>
<div class=3D"ContentPasted0">packages - audit.x86_64, audit-libs.x86_64 - =
3.0.7-4.el8</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">RedHat 7.9, Centos 7.9</div>
<div class=3D"ContentPasted0">kernel - 3.10.0-1160.80.1.el7.x86_64</div>
<div class=3D"ContentPasted0">packages - audit.x86_64, audit-libs.x86_64 - =
2.8.5-4.el7</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Ubuntu 22.04.2</div>
<div class=3D"ContentPasted0">kernel - 5.15.0-60-generic</div>
<div class=3D"ContentPasted0">packages - auditd, libaudit-common, libaudit-=
dev:amd64, libaudit1:amd64 -1:3.0.7-1build1</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">----<br>
</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Configuration files on RedHat 9.0</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">/etc/audit/audit.rules</div>
<div class=3D"ContentPasted0">----</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">-D</div>
<div class=3D"ContentPasted0">-b 8192</div>
<div class=3D"ContentPasted0">-f 1</div>
<div class=3D"ContentPasted0">-w / -p w -k TEST</div>
<div class=3D"ContentPasted0">--backlog_wait_time 60000</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">/etc/audit/auditd.conf</div>
<div class=3D"ContentPasted0">----</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">local_events =3D yes</div>
<div class=3D"ContentPasted0">write_logs =3D yes</div>
<div class=3D"ContentPasted0">log_file =3D /var/log/audit/audit.log</div>
<div class=3D"ContentPasted0">log_group =3D root</div>
<div class=3D"ContentPasted0">log_format =3D ENRICHED</div>
<div class=3D"ContentPasted0">flush =3D INCREMENTAL_ASYNC</div>
<div class=3D"ContentPasted0">freq =3D 50</div>
<div class=3D"ContentPasted0">max_log_file =3D 8</div>
<div class=3D"ContentPasted0">num_logs =3D 5</div>
<div class=3D"ContentPasted0">priority_boost =3D 4</div>
<div class=3D"ContentPasted0">name_format =3D NONE</div>
<div class=3D"ContentPasted0">##name =3D mydomain</div>
<div class=3D"ContentPasted0">max_log_file_action =3D ROTATE</div>
<div class=3D"ContentPasted0">space_left =3D 75</div>
<div class=3D"ContentPasted0">space_left_action =3D SYSLOG</div>
<div class=3D"ContentPasted0">verify_email =3D yes</div>
<div class=3D"ContentPasted0">action_mail_acct =3D root</div>
<div class=3D"ContentPasted0">admin_space_left =3D 50</div>
<div class=3D"ContentPasted0">admin_space_left_action =3D SUSPEND</div>
<div class=3D"ContentPasted0">disk_full_action =3D SUSPEND</div>
<div class=3D"ContentPasted0">disk_error_action =3D SUSPEND</div>
<div class=3D"ContentPasted0">use_libwrap =3D yes</div>
<div class=3D"ContentPasted0">##tcp_listen_port =3D 60</div>
<div class=3D"ContentPasted0">tcp_listen_queue =3D 5</div>
<div class=3D"ContentPasted0">tcp_max_per_addr =3D 1</div>
<div class=3D"ContentPasted0">##tcp_client_ports =3D 1024-65535</div>
<div class=3D"ContentPasted0">tcp_client_max_idle =3D 0</div>
<div class=3D"ContentPasted0">transport =3D TCP</div>
<div class=3D"ContentPasted0">krb5_principal =3D auditd</div>
<div class=3D"ContentPasted0">##krb5_key_file =3D /etc/audit/audit.key</div=
>
<div class=3D"ContentPasted0">distribute_network =3D no</div>
<div class=3D"ContentPasted0">q_depth =3D 1200</div>
<div class=3D"ContentPasted0">overflow_action =3D SYSLOG</div>
<div class=3D"ContentPasted0">max_restarts =3D 10</div>
<div class=3D"ContentPasted0">plugin_dir =3D /etc/audit/plugins.d</div>
<div class=3D"ContentPasted0">end_of_event_timeout =3D 2</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">----</div>
<div class=3D"ContentPasted0">----</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0 elementToProof">As suggested by Steve, I check=
ed also the following rules independently instead of '-w / -p w -k TEST'.</=
div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">-a always,exit -F arch=3Db64 -F dir=3D/root/d=
ir1/dir2/dir3/ -k TEST</div>
<div class=3D"ContentPasted0">-a always,exit -F arch=3Db64 -F path=3D/root/=
dir1/dir2/dir3/file1 -k TEST</div>
<div class=3D"ContentPasted0">-a always,exit -F arch=3Db64 -S unlinkat -k T=
EST</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">And I always get the same results like in wat=
ch '-w / -p w' case. There is still not enough information in the 'audit.lo=
g' file to reconstruct the full path to the deleted file.</div>
<div><br class=3D"ContentPasted0">
</div>
On the other hand, the goal is to monitor events across the file system. Th=
ere is no way to predict what will be deleted. Therefore, applying rules to=
 specific directories and files seems to be the wrong way to go.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
----<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
/Jarek.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
jjozwiak (at) catalogicsoftware.com<br>
</div>
</body>
</html>

--_000_BYAPR01MB477677C98795C466C6DD436AC26D9BYAPR01MB4776prod_--

--===============5116898663480315153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============5116898663480315153==--

