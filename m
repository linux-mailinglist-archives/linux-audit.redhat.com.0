Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 59F58EC675
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 17:15:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572624954;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=goQVu5sD6qWN+7rGE1DYqoTNRhmxh0fMHnH2JhFShRQ=;
	b=TWWmYgk3VtbRMu8FrZ8K9Ik0PbR5j663F0AEovBa5RhSF+V7vFmXqvIi5CLc1/UsdJ6hjk
	WE+f7y1gAXKawMnklN4TYc89lH0pr1nLBpQBnZKx+g40LX9jdijaclHGYhNBX3nlduYpWo
	UF0E1TtJYIw6NnaLLdyEEWUeP/ftUpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-jD0kolCSNrevHgBQKb9c4g-1; Fri, 01 Nov 2019 12:15:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67CFC800D49;
	Fri,  1 Nov 2019 16:15:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3286A60BEC;
	Fri,  1 Nov 2019 16:15:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F34218089C8;
	Fri,  1 Nov 2019 16:15:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA1FtDUX019069 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 Nov 2019 11:55:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77FAB1001DD7; Fri,  1 Nov 2019 15:55:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E8C11001B36;
	Fri,  1 Nov 2019 15:55:10 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
	[67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E1413086240;
	Fri,  1 Nov 2019 15:55:10 +0000 (UTC)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id xA1FC9Vs008674;
	Fri, 1 Nov 2019 08:55:07 -0700
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
	by m0089730.ppops.net with ESMTP id 2w0c4v38fa-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2019 08:55:07 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
	prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1713.5; Fri, 1 Nov 2019 08:55:03 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
	by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
	(version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
	via Frontend Transport; Fri, 1 Nov 2019 08:55:03 -0700
Received: from SN6PR15MB2446.namprd15.prod.outlook.com (52.135.65.158) by
	SN6PR15MB2463.namprd15.prod.outlook.com (52.135.66.11) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.22; Fri, 1 Nov 2019 15:55:02 +0000
Received: from SN6PR15MB2446.namprd15.prod.outlook.com
	([fe80::5d9c:c9a8:a074:f902]) by
	SN6PR15MB2446.namprd15.prod.outlook.com
	([fe80::5d9c:c9a8:a074:f902%7]) with mapi id 15.20.2387.028;
	Fri, 1 Nov 2019 15:55:02 +0000
From: Chris Mason <clm@fb.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH] audit: set context->dummy even when audit is off
Thread-Topic: [PATCH] audit: set context->dummy even when audit is off
Thread-Index: AQHVkAncrhonQVVxy06vYxt2pY3gVKd1ZVQAgACm2QCAAFHHAIAAG16A
Date: Fri, 1 Nov 2019 15:55:02 +0000
Message-ID: <EE4EBB7B-B3CA-4CFC-9B14-843ADDB9F2EA@fb.com>
References: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<CAHC9VhRwRSGa5JSL0=cXxG-oOg9jUve9OEYyTCqTxzr=aMdGxg@mail.gmail.com>
	<B63048C4-3158-453B-859A-C5574AACDC36@fb.com> <3063279.ZKBa9cPvsK@x2>
In-Reply-To: <3063279.ZKBa9cPvsK@x2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN7PR02CA0012.namprd02.prod.outlook.com
	(2603:10b6:408:20::25) To SN6PR15MB2446.namprd15.prod.outlook.com
	(2603:10b6:805:24::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c091:480::5594]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8c78441-4227-491f-76e0-08d75ee3daff
x-ms-traffictypediagnostic: SN6PR15MB2463:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR15MB2463B2C54DBD4D6E974196B7D3620@SN6PR15MB2463.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(136003)(39860400002)(396003)(366004)(346002)(189003)(199004)(7736002)(5660300002)(8676002)(8936002)(2906002)(46003)(2616005)(446003)(476003)(11346002)(6512007)(305945005)(256004)(81156014)(64756008)(66476007)(486006)(66446008)(81166006)(66556008)(386003)(186003)(6506007)(53546011)(102836004)(6116002)(6916009)(52116002)(76176011)(50226002)(66946007)(316002)(6246003)(14454004)(71190400001)(6436002)(36756003)(25786009)(478600001)(33656002)(54906003)(4326008)(99286004)(71200400001)(6486002)(86362001)(229853002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR15MB2463;
	H:SN6PR15MB2446.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T0kOr1XP8OlxAnOva0zpvB+6rnQkKof5JlS2thiuRE782C4JUwafGXY8csDBScAsnXZDPjJQ09FRW4s4nniD51vxa/s9sbxH6UMAWHvTUGHPXGQzF6jGDQ6CE/soUdFi/YJ7DoHWoAm488sGl7AQ/hNXffkU9PH9ut2Do05sWyaeibvE6b3nXEeN+2hHPyrGyBQpxoLTQAqT3sAomBffD5YF1BPm+4TKfLEv7zIDXzCZDNseVc9mkxyyKK+OgGUasbfZuk//h0lYtmjV1j/FUfk9LTEgmUZKjK5MKGWQpXDvIT1k4l+bulU8QxVNATY5rHrBbuaWjSmjAMMLDXjGedzFFIZiuTCXS1jz3oKDFrkeVIyVUQOypxndcFfA3GiLzaIaV2pslVBYT067AcBs91cDuymkjyL98AW5pcddBTnySnYT5j7Q0SemK1ERwJWx
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c78441-4227-491f-76e0-08d75ee3daff
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 15:55:02.2725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hxU1jac83L3MTeqqHAz5kv6KfsBByAFdyyU2Pax5AkudAk3wdevIOUMGNzrwN1hd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR15MB2463
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-31_08:2019-10-30,2019-10-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
	mlxlogscore=999
	impostorscore=0 malwarescore=0 adultscore=0 clxscore=1011 mlxscore=0
	priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
	phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-1908290000 definitions=main-1911010024
X-FB-Internal: deliver
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Fri, 01 Nov 2019 15:55:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Fri, 01 Nov 2019 15:55:10 +0000 (UTC) for IP:'67.231.153.30'
	DOMAIN:'mx0b-00082601.pphosted.com'
	HELO:'mx0a-00082601.pphosted.com' FROM:'clm@fb.com' RCPT:''
X-RedHat-Spam-Score: -0.8  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 67.231.153.30 mx0b-00082601.pphosted.com 67.231.153.30
	mx0b-00082601.pphosted.com <prvs=6208f608a7=clm@fb.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA1FtDUX019069
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 01 Nov 2019 12:15:30 -0400
Cc: Dave Jones <davej@codemonkey.org.uk>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Kyle McMartin <jkkm@fb.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: jD0kolCSNrevHgBQKb9c4g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1 Nov 2019, at 10:16, Steve Grubb wrote:

> On Friday, November 1, 2019 9:24:17 AM EDT Chris Mason wrote:
>> On 31 Oct 2019, at 19:27, Paul Moore wrote:
>>> On Thu, Oct 31, 2019 at 12:40 PM Chris Mason <clm@fb.com> wrote:
>>> [ ... ]
>>> Hi Chris,
>>>
>>> This is a rather hasty email as I'm at a conference right now, but I
>>> wanted to convey that I'm not opposed to making sure that the NTP
>>> records obey the audit configuration (that was the original intent
>>> after all), I think it is just that we are all a little confused as 
>>> to
>>> why you are seeing the NTP records *and*only* the NTP records.
>>
>> This part is harder to nail down because there's a window during boot
>> where journald has enabled audit but chef hasn't yet run in and 
>> turned
>> it off, so we get a lot of logs early and then mostly ntp after that.
>
> This is the root of the problem. Journald should never turn on audit 
> since it
> has no idea if auditd even has rules to load. What if the end user 
> does not
> want auditing? By blindly enabling audit without knowing if its 
> wanted, it
> causes a system performance hit even with no rules loaded. It would be 
> best
> if journald leaves audit alone. If it wants to listen on the multicast
> socket, so be it. It should just listen and not try to alter the 
> system.
>
> Back to ntp, it sounds like the ntp record needs to check for 
> audit_enabled
> rather than the dummy context.

I'm not against sprinkling more audit_enabled checks, but we'd have to 
change audit_inode() and a bunch of the other callers of 
audit_dummy_context() as well.

-chris

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

