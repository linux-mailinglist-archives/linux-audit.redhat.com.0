Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2A985EFE9F
	for <lists+linux-audit@lfdr.de>; Tue,  5 Nov 2019 14:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572960710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JaV6X256dz0gMTNGXpkkqiFCxoKpox2dpL+kOeN0E2w=;
	b=Cv1eHR67zqzKLdxlreYMhPF7/VZP2m6/0jacperqRNrjfFpt1SJ5YGQkS6atAX6dVVL8xb
	97cJ0S87hvs6c/+E+bjkWd1k/lBOnYujrE7xnuHKvQNQdlUEVwHkUNKTYR1H+L/IQ7GOkP
	9eOpGeHveT3hrOp8HuSosw3WqcDumWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-x0MXh1amPgmi8An7CzzjMw-1; Tue, 05 Nov 2019 08:31:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB9538017DE;
	Tue,  5 Nov 2019 13:31:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0CF45C1B2;
	Tue,  5 Nov 2019 13:31:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 930B818005AA;
	Tue,  5 Nov 2019 13:31:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA50dWTS025562 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 19:39:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F2D93608B4; Tue,  5 Nov 2019 00:39:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C79A608A5;
	Tue,  5 Nov 2019 00:39:29 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
	[67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E4682A09C5;
	Tue,  5 Nov 2019 00:39:28 +0000 (UTC)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id xA50bKGk002561;
	Mon, 4 Nov 2019 16:39:25 -0800
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
	by m0001303.ppops.net with ESMTP id 2w15fjupyh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2019 16:39:25 -0800
Received: from prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) by
	prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Mon, 4 Nov 2019 16:39:23 -0800
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
	prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Mon, 4 Nov 2019 16:39:23 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
	by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
	(version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
	via Frontend Transport; Mon, 4 Nov 2019 16:39:23 -0800
Received: from SN6PR15MB2446.namprd15.prod.outlook.com (52.135.65.158) by
	SN6PR15MB2494.namprd15.prod.outlook.com (52.135.66.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Tue, 5 Nov 2019 00:39:21 +0000
Received: from SN6PR15MB2446.namprd15.prod.outlook.com
	([fe80::5d9c:c9a8:a074:f902]) by
	SN6PR15MB2446.namprd15.prod.outlook.com
	([fe80::5d9c:c9a8:a074:f902%7]) with mapi id 15.20.2408.024;
	Tue, 5 Nov 2019 00:39:21 +0000
From: Chris Mason <clm@fb.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: set context->dummy even when audit is off
Thread-Topic: [PATCH] audit: set context->dummy even when audit is off
Thread-Index: AQHVkAncrhonQVVxy06vYxt2pY3gVKd1ZVQAgACm2QCABbABgIAABqgA
Date: Tue, 5 Nov 2019 00:39:21 +0000
Message-ID: <5E08422A-BFE2-4515-A804-3DB42B7D8550@fb.com>
References: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20191031163931.1102669-1-clm@fb.com>
	<CAHC9VhRwRSGa5JSL0=cXxG-oOg9jUve9OEYyTCqTxzr=aMdGxg@mail.gmail.com>
	<B63048C4-3158-453B-859A-C5574AACDC36@fb.com>
	<CAHC9VhR92Ade8_d1UnTy4_hJDxmwZPU31eubnrq=ejPBjkTS4w@mail.gmail.com>
In-Reply-To: <CAHC9VhR92Ade8_d1UnTy4_hJDxmwZPU31eubnrq=ejPBjkTS4w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0090.namprd02.prod.outlook.com
	(2603:10b6:208:51::31) To SN6PR15MB2446.namprd15.prod.outlook.com
	(2603:10b6:805:24::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c091:480::5e73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83541d98-df51-4afb-3f92-08d76188997c
x-ms-traffictypediagnostic: SN6PR15MB2494:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR15MB2494D10E05519E3534A136CED37E0@SN6PR15MB2494.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(366004)(396003)(376002)(346002)(199004)(189003)(51914003)(14454004)(33656002)(66946007)(6436002)(66446008)(64756008)(7736002)(2906002)(5660300002)(478600001)(25786009)(305945005)(54906003)(86362001)(316002)(81166006)(186003)(476003)(8676002)(81156014)(11346002)(486006)(36756003)(6116002)(50226002)(8936002)(446003)(76176011)(102836004)(52116002)(99286004)(6506007)(6916009)(2616005)(6512007)(4326008)(229853002)(71200400001)(71190400001)(66476007)(386003)(256004)(14444005)(66556008)(46003)(53546011)(6246003)(6486002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR15MB2494;
	H:SN6PR15MB2446.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XGCMiCYhSIdeal55YyRSzMoEQyBB/06Uvw8qAVLa5S9lKskHZaXglS4ru0xUcYR4gNhO0IUD4ofzyVClLeatBifrcX58agFe6TrKuvmQL8/L/j2Pg/ihFKqjh7Wenio5fkevmB+rw59VN9/ztdHPkFCkIyANa8/7NbpwRVKT1i9VT0VrQ2m+kd22k/2/N9GbGUD9njj/085R/WbbEJCcc22EHx8WIMT/c89rdrHZhwubTwDKjHLaoDZdJDtvYTg53Gq1Ugtf/SUzQBvceVZp/w0ZV/CDvoEIyVzELxBwpQQMHx8SftnJMfKxHA93equJOWOJd1y0pG7z/MmASjRt1TfYuycXxFIx2P8c8IMnDZA6v29IFZsfHL4AMcHkwQy3jhZOKlApSPuXEBdao9TkHOzlDDHPilNdaYRlMOW6244EbnhCjxBFlh5MNHQZhlTq
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 83541d98-df51-4afb-3f92-08d76188997c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 00:39:21.6346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2ZXB4/R/Ki2O5Tu9LVd2wA6f5G6o7pvrP0PgKCvNorBOiuQl0RL0/ZPlaC6d1QI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR15MB2494
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-11-04_12:2019-11-04,2019-11-04 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	mlxlogscore=999
	spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
	impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
	clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-1908290000 definitions=main-1911050002
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Tue, 05 Nov 2019 00:39:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 05 Nov 2019 00:39:28 +0000 (UTC) for IP:'67.231.153.30'
	DOMAIN:'mx0b-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'clm@fb.com' RCPT:''
X-RedHat-Spam-Score: -0.8  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.153.30 mx0b-00082601.pphosted.com 67.231.153.30
	mx0b-00082601.pphosted.com <prvs=6212e907c2=clm@fb.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA50dWTS025562
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 05 Nov 2019 08:31:21 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: x0MXh1amPgmi8An7CzzjMw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4 Nov 2019, at 19:15, Paul Moore wrote:

> On Fri, Nov 1, 2019 at 9:24 AM Chris Mason <clm@fb.com> wrote:
>> On 31 Oct 2019, at 19:27, Paul Moore wrote:
>>> It's been a while, but I thought we suggested Dave try running
>>> 'auditctl -a never,task' to see if that would solve his problem and 
>>> I
>>> believe his answer was no, which confused me a bit as the
>>> audit_filter_task() call in audit_alloc() should see that rule and
>>> return a state of AUDIT_DISABLED which not only prevents 
>>> audit_alloc()
>>> from allocating an audit_context (and remember if the audit_context 
>>> is
>>> NULL then audit_dummy_context() returns true), but it also clears 
>>> the
>>> TIF_SYSCALL_AUDIT flag (which I'm guessing you also want).
>>
>> Thanks for the reminder on this part, I meant to test it.  Yes, 
>> auditctl
>> -a never,task does stop the messages, even without my patch applied.
>
> I'm glad to hear that worked, I was going to be *very* confused if you
> came back and said you were still seeing NTP records.
>
> I would suggest that regardless of what happens with audit_enabled you
> likely want to keep this audit rule as part of your boot
> configuration, not only does it squelch the audit records, but it
> should improve performance as well (at the cost of no syscall
> auditing).  A number of Linux distros have this as their default at
> boot.
>

Definitely, we'll be testing auditctl -a never,task internally.  Before 
we went down that path I wanted to fully understand what was going on, 
but I think all the big questions have been answered at this point.

I'm happy to try variations on my patch, but if you want to include it, 
please do remember that I've really only tested it with auditing off.

-chris

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

