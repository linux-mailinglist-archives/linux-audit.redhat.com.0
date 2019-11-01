Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 03812EC3A7
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 14:28:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572614904;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3cAgZdsBBU8zLFC0izjIWP3ev1Qk0PCd1B1IPhfXBZE=;
	b=da9zN2bznNB5YQyLp9Su0hVDJWWLO0lefJG2+lEAbsuiSi/jPNZiFuiNnZK3VDo8yzRjNq
	vtNDscoA1arFDRuYnO9Gg0VHbIQGa2nmOqz+Wr+rWMrkqngF82y1o7qHlh7/bdIKNT0b4/
	fOn6HJfH5apcMBprOpm9ANwxGbQRZSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-YsfD5IzjP1uol9jtP47DUQ-1; Fri, 01 Nov 2019 09:28:22 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ECF01800D6B;
	Fri,  1 Nov 2019 13:28:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F33860870;
	Fri,  1 Nov 2019 13:28:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88E4C18034E9;
	Fri,  1 Nov 2019 13:28:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA1DOrwY008842 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 Nov 2019 09:24:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 808385D6D8; Fri,  1 Nov 2019 13:24:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02BE05D6B7;
	Fri,  1 Nov 2019 13:24:51 +0000 (UTC)
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
	[67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13070308FBED;
	Fri,  1 Nov 2019 13:24:50 +0000 (UTC)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xA1DOiqE012334; Fri, 1 Nov 2019 06:24:47 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
	by mx0a-00082601.pphosted.com with ESMTP id 2w00t55v1p-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 01 Nov 2019 06:24:47 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
	ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Fri, 1 Nov 2019 06:24:21 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
	by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
	via Frontend Transport; Fri, 1 Nov 2019 06:24:21 -0700
Received: from SN6PR15MB2446.namprd15.prod.outlook.com (52.135.65.158) by
	SN6PR15MB2416.namprd15.prod.outlook.com (52.135.65.152) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.17; Fri, 1 Nov 2019 13:24:18 +0000
Received: from SN6PR15MB2446.namprd15.prod.outlook.com
	([fe80::5d9c:c9a8:a074:f902]) by
	SN6PR15MB2446.namprd15.prod.outlook.com
	([fe80::5d9c:c9a8:a074:f902%7]) with mapi id 15.20.2387.028;
	Fri, 1 Nov 2019 13:24:18 +0000
From: Chris Mason <clm@fb.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: set context->dummy even when audit is off
Thread-Topic: [PATCH] audit: set context->dummy even when audit is off
Thread-Index: AQHVkAncrhonQVVxy06vYxt2pY3gVKd1ZVQAgADp5wA=
Date: Fri, 1 Nov 2019 13:24:17 +0000
Message-ID: <B63048C4-3158-453B-859A-C5574AACDC36@fb.com>
References: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20191031163931.1102669-1-clm@fb.com>
	<CAHC9VhRwRSGa5JSL0=cXxG-oOg9jUve9OEYyTCqTxzr=aMdGxg@mail.gmail.com>
In-Reply-To: <CAHC9VhRwRSGa5JSL0=cXxG-oOg9jUve9OEYyTCqTxzr=aMdGxg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR07CA0010.namprd07.prod.outlook.com
	(2603:10b6:208:1a0::20) To SN6PR15MB2446.namprd15.prod.outlook.com
	(2603:10b6:805:24::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c091:480::f277]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 052d569e-46f3-4008-d9fd-08d75ececc2a
x-ms-traffictypediagnostic: SN6PR15MB2416:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR15MB2416612FB068C7EBA24F046FD3620@SN6PR15MB2416.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(376002)(366004)(39860400002)(396003)(189003)(199004)(51914003)(52116002)(8936002)(76176011)(66446008)(71200400001)(305945005)(6436002)(66556008)(33656002)(50226002)(7736002)(8676002)(81156014)(102836004)(81166006)(64756008)(66476007)(6486002)(71190400001)(478600001)(25786009)(46003)(5660300002)(14454004)(229853002)(256004)(386003)(476003)(99286004)(6246003)(14444005)(316002)(6506007)(2616005)(6916009)(53546011)(36756003)(54906003)(4326008)(186003)(66946007)(446003)(2906002)(11346002)(486006)(86362001)(6116002)(6512007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR15MB2416;
	H:SN6PR15MB2446.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XtFpG6LdmOGnfTG7uxTYGsx70JDiRsg9OQ54e173gJU6zEGXBpDmjHRoWFyFHUNvmp4kaOdOa1M/vVnGx9b1XlgNlbwJLJ9RGVx93ByXPvTmOsJ7ZeygUViCl33sc36HR5vV4hr/TTF5GOW5YKrjYAe0uHJqnul73ORVZhN3fMlgo/uQbiXAOQEkH5n+dmEpX91XsO2SToGSAbqvIYwCSGqLQ96ne/NlxqmCmvbccUvfoadMUfUa3ydLTAyyoqv+RpiYJaH0KzelPyeNRxQ7n7uh1OrVMXhaksp+NJgqq6H86FL7us3AhrQU/kaG5HMqMQT+YRaFFfWDn3/gQTdqyz+VdNBGbOMAdhxxbHh6BZESSbVnXlov+n68VFbUnMllkUfBeksjNCbkialL5RJnOxtw4NWQiOda+UrMJvUR+s7e97mZkFLNicN/3Z6W/fDV
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 052d569e-46f3-4008-d9fd-08d75ececc2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 13:24:17.9717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcHSE22ZnOXuSo82ujCJVsVd6qzP5skPC9KtZWh8RsvH5FlYIqORIR1AJiOp7L+3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR15MB2416
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-11-01_04:2019-10-30,2019-11-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	bulkscore=0
	lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0
	mlxlogscore=999
	malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
	suspectscore=0
	clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1908290000 definitions=main-1911010134
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Fri, 01 Nov 2019 13:24:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Fri, 01 Nov 2019 13:24:50 +0000 (UTC) for IP:'67.231.153.30'
	DOMAIN:'mx0b-00082601.pphosted.com'
	HELO:'mx0b-00082601.pphosted.com' FROM:'clm@fb.com' RCPT:''
X-RedHat-Spam-Score: -0.8  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.153.30 mx0b-00082601.pphosted.com 67.231.153.30
	mx0b-00082601.pphosted.com <prvs=6208f608a7=clm@fb.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA1DOrwY008842
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 01 Nov 2019 09:25:46 -0400
Cc: Dave Jones <davej@codemonkey.org.uk>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	Kyle McMartin <jkkm@fb.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
X-MC-Unique: YsfD5IzjP1uol9jtP47DUQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 31 Oct 2019, at 19:27, Paul Moore wrote:

> On Thu, Oct 31, 2019 at 12:40 PM Chris Mason <clm@fb.com> wrote:
> [ ... ]
> Hi Chris,
>
> This is a rather hasty email as I'm at a conference right now, but I
> wanted to convey that I'm not opposed to making sure that the NTP
> records obey the audit configuration (that was the original intent
> after all), I think it is just that we are all a little confused as to
> why you are seeing the NTP records *and*only* the NTP records.

This part is harder to nail down because there's a window during boot 
where journald has enabled audit but chef hasn't yet run in and turned 
it off, so we get a lot of logs early and then mostly ntp after that.

I feel like the answer is that most of the places that actually log 
audit records are also checking audit_enabled.  Poking a bit with 
cscope, we're not using most of the places that rely only on 
audit_dummy_context().

I grabbed the last week or so of audit: lines from netconsole, and most 
of them (73%) were type 1130 from early in the boot.  These are the ones 
turned off when chef runs.  Another big chunk were the one time audit 
initialized message from boot, mostly reflecting our rollout of the new 
kernel.  After that it was ntp and couple of random things like 
fanotify.

>
> It's been a while, but I thought we suggested Dave try running
> 'auditctl -a never,task' to see if that would solve his problem and I
> believe his answer was no, which confused me a bit as the
> audit_filter_task() call in audit_alloc() should see that rule and
> return a state of AUDIT_DISABLED which not only prevents audit_alloc()
> from allocating an audit_context (and remember if the audit_context is
> NULL then audit_dummy_context() returns true), but it also clears the
> TIF_SYSCALL_AUDIT flag (which I'm guessing you also want).
>

Thanks for the reminder on this part, I meant to test it.  Yes, auditctl 
-a never,task does stop the messages, even without my patch applied.

-chris

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

