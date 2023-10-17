Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F81C7CCF76
	for <lists+linux-audit@lfdr.de>; Tue, 17 Oct 2023 23:42:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697578963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HkZ9CCteQYNqW0HrSV5LJIBpRroJwQYbMsJZW7i6jiY=;
	b=EFt8MdRTlLZmvPOR+heeO8CHKYKQJVuc+/F5Fm8TPnD7NPUlO1gObuJwfLo3N+fA224a6A
	OCEa/nHnzKG46Q1s1hFBy7ikIs70UvXMoQczpfIur4d7CAWzyTcZVzONggJuICNvOrK0hY
	/Q7Xc9uwGg0wQjXGfl05e2wgDWi0i3M=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-yWI8N0q9N52P15rDshjy7w-1; Tue, 17 Oct 2023 17:42:40 -0400
X-MC-Unique: yWI8N0q9N52P15rDshjy7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B85C93C1ACDC;
	Tue, 17 Oct 2023 21:42:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC5508C4;
	Tue, 17 Oct 2023 21:42:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C5F0D19466F7;
	Tue, 17 Oct 2023 21:42:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 269CB19465B3 for <linux-audit@listman.corp.redhat.com>;
 Tue, 17 Oct 2023 14:21:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EC928C15BB8; Tue, 17 Oct 2023 14:21:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4354C15BBC
 for <linux-audit@redhat.com>; Tue, 17 Oct 2023 14:21:45 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFAA0862F1F
 for <linux-audit@redhat.com>; Tue, 17 Oct 2023 14:21:45 +0000 (UTC)
Received: from mx0b-002c1b01.pphosted.com (mx0b-002c1b01.pphosted.com
 [148.163.155.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-K4vfd9OJMWCYQF1Oq-ddxQ-1; Tue, 17 Oct 2023 10:21:43 -0400
X-MC-Unique: K4vfd9OJMWCYQF1Oq-ddxQ-1
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39HCwY7k011842; Tue, 17 Oct 2023 07:21:40 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3ts6hwu5xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Oct 2023 07:21:40 -0700 (PDT)
Received: from DM5PR02MB3830.namprd02.prod.outlook.com (2603:10b6:4:b0::29) by
 BN0PR02MB8159.namprd02.prod.outlook.com (2603:10b6:408:164::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 14:21:38 +0000
Received: from DM5PR02MB3830.namprd02.prod.outlook.com
 ([fe80::26ba:be45:ee4b:e1ae]) by DM5PR02MB3830.namprd02.prod.outlook.com
 ([fe80::26ba:be45:ee4b:e1ae%4]) with mapi id 15.20.6863.046; Tue, 17 Oct 2023
 14:21:37 +0000
Message-ID: <7c6c965e-2644-46e1-832c-321ec256291d@nutanix.com>
Date: Tue, 17 Oct 2023 15:21:32 +0100
User-Agent: Mozilla Thunderbird
To: linux-audit@redhat.com
From: Chris Riches <chris.riches@nutanix.com>
Subject: netlink ACK handling in audit_set_pid()
X-ClientProxiedBy: SJ0PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::29) To DM5PR02MB3830.namprd02.prod.outlook.com
 (2603:10b6:4:b0::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR02MB3830:EE_|BN0PR02MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6da3e0-6649-4429-87c5-08dbcf1c5f95
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: o3p3DIvcS8sWld0q7IeYT6ut7yLXX3f1Zj9v7slHkV8GjEhqx9gUn7lxygNdvIg27LytZX93BW7BNn1ow6qJXOYXGkCRgPBaac4NCbCAaSqxbrKIg0mVtJvjnqaohk01U0UmprVZ04LLKlxLtyljs0iWh8KW+tWVPA1ivNsZEd0LVgWBLwhxWE+mfZKlXkADfjZXWqVe3gLSQprLhIu1bXpliQCeh+bQC/m6JccknGWKPMvMs4bUJPyhz3q9i5qtNvEM/ufje16SaDRQfghUrqZckL/ClcLZg3hWO9h2xFSE8KzTdYBh3WCqcuzsfvovIxW0bP0EJqQlQE2X/4e+PxnodgEANff60RRvErw+1zVxZzHTKGsRo+1sBxapertEK1QVfKblY3wnNT6Isk8IOy1NL2kbOfb+GArLylMu40iBYHZMX938mP9mcNNP0FE/t/2/qviFNuHt7/YpQQ/0PSe0+OwHbsXJUMWt82OPtiGse4kQR3aBMa3rXX/PoW9bLvZB2QXKYW/LtUSmFWKOVKzMDVZ7oQ47Dv2CROWZOzmUCKlEkmlMFWieHcCqro91y71fHXQ0LFpqAhgtHI41CpxPHIT0LurVAPYrBws1Bbogol5fOzgDYgPy3v/sbaiXWBGLsINnFBribbqxZ9kOkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR02MB3830.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(44832011)(107886003)(2616005)(26005)(8676002)(8936002)(4326008)(5660300002)(38100700002)(83380400001)(31686004)(41300700001)(478600001)(31696002)(6486002)(966005)(86362001)(2906002)(316002)(6512007)(6666004)(6506007)(66946007)(66556008)(36756003)(66476007)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlNLVVBZdDN3Vld0bVNRK0IyanNoODVEN3RBbm5HdStSOXhaNXc4UGhCUUdO?=
 =?utf-8?B?OG1XYVpqWm5neURVUWRBTGFNbEZJWU5nbmd3QVFZUzF2RXRZN1pnSEk2aXVk?=
 =?utf-8?B?akk2d3ljWTR3bXVwU21tVkVoaElDWjdmVFRPK2pKK1k3UFR4ME5sazNtclo0?=
 =?utf-8?B?OUQwellFaXBoY1VoMjdXWFpGMUZhSE9YcWpRMHBsenY5cXZDOHhQTi9qZTJH?=
 =?utf-8?B?U3VjaXY2UThLYk9IaDB2S1grekJ5bVpCTkJmd2hWVGZVOGZNdUplTzdMZDRO?=
 =?utf-8?B?Uk82bzB4Tkx0eDlEUU1QclZzb1dtRlQyOWJVeE4zMFBVak1NUWdwREx6MXVT?=
 =?utf-8?B?dXI2WENWenJsOEQ0QXJZb2hLTVk2ZzdJZ043VFJqOXI2VStrNDVqOGwyOXFC?=
 =?utf-8?B?cDZMWGJETEF3Wm03MXh5bm9GVW1yS0hIOHVsK2I1a1JzQjhjL2ZIRzBWYmVu?=
 =?utf-8?B?QUhGdGQyQ1ZpVmQ0ejRrdDE3RWM1bGNvZWVqM2VMYUFXSWhtZk1wcE1QRlp1?=
 =?utf-8?B?S0NSV1RXVkpyaTBhMnhsVzdLalQzR1h0aEtFeG11QzZ2LzlmVGR2aXFDWExt?=
 =?utf-8?B?ajRFRGpKcDRoQThqem5LNkRRU0FvaS9Sd1hyTWpJbm1uaXZaQ0hORW1BcDZX?=
 =?utf-8?B?K2xqenA2aVkvdGJvYlFpV2d1MDF6Z1JWZGdFeVdVYW45OFdjYzNmV2UxNTF5?=
 =?utf-8?B?Mi9CT3kvYkdzQ3hNWVpsUXhmeW9PSkJTam4xNmpKMkpVcWdVZFhVY2lISVRH?=
 =?utf-8?B?RHRkdE9NamQ0RWp4OEtqUG9RbmV2OVk5VXdVMm5ER0xWUkREZ2V0blJiNDZO?=
 =?utf-8?B?MVd1WldHVDlkblYrdmczcFJYMDM2MHEybXJod29pZWpZbS9ISmpGTHAxYnNx?=
 =?utf-8?B?cGo2Um8zd3YwcUpKaGp6Zkg0cXg5Z0RYYkQxT1VYMDdWcW0zUmNES21BeHdm?=
 =?utf-8?B?b0ZxSHZ6VkZkemsvdkt2Q2h0ZVRETXF1ay9oZzF1a1BSNUJaSXFjZ0g3WjdO?=
 =?utf-8?B?TmxRYmdCbEhaeUcxKzdZbnVoRlRkNUFQc3pYd3Z5dnYyTGtwUnRITDdWczNu?=
 =?utf-8?B?dElrZUZsVG1Xc3J6Q3poaC9ER29xYVU2cjR2VzV3UitwTy9FRzFnSngvMXUz?=
 =?utf-8?B?eEg1cHQrN3pLckkwSjgrZStCWU1ELzRXZEpEMGg2eUxDMXdqb01lYnBFQ3Ex?=
 =?utf-8?B?dmZoV1U5Z0k2MWZMVXBicThGaDJqVmt0bTFNbS9TWE5KY1YrVVhpMHFJQUlw?=
 =?utf-8?B?UVVEWTBQVVcxZW9SWU1qQ21aZzJUelhPY3R0YjdiUnlLQTcrdEwwOHZLSXQx?=
 =?utf-8?B?QTJLbnV1dkcyS1Y4YmtxaWtPZ2Rwek8vRmVOTFh0eEttS3R4TFd6RE5wRlVl?=
 =?utf-8?B?Q1h0aG5weXlEM1ptQWVJbC82bFB4cFJWUDFKZ0g4MVNiRGV4eEVtU01CNE1s?=
 =?utf-8?B?ZWZqTVhDNUo3NmRhaHRZRFljQ20xZEFEdkhRWHhwU2dJQVdJK3RvZkxQK3dh?=
 =?utf-8?B?NFdtM3hidjFHMm1zVHJmcSt5S1ZiZjdQNUU1cjNmNGs1M3p0VlVmekU3c3Yx?=
 =?utf-8?B?dUh0djZKZXFzWFAzVUN4eVM2VkNyQTNDWFF3K3VQWUZmbytMWXBDNlh2NnJT?=
 =?utf-8?B?WjY0TDh2bmNGMHFGbXo0V3oyQWFLOW04R3RTVWk2dDB4RGRSV3JnYU1UVWYy?=
 =?utf-8?B?ZjVlUjVBZzdaWWZBVndMb3F5ZWdjMDJSKzMzeXk5K1paQU4reDMxNWNSQ1p2?=
 =?utf-8?B?MWFYMHlkTjBRQWtKNTgxcHNXWXJaWUJjd2xycmFJRlo1Ym9rVjB1VlpPR1VJ?=
 =?utf-8?B?RlVrZGVxbm1tY3dnWktZSnhuUnlqTElCeHRKOE5kL1l5UzRNb2VveFBibXNx?=
 =?utf-8?B?dnJ3bnBZc0pOZVVEcmxwcTY5T3UrRy9VWllRRnA3cmdVV1ZZa1hQcUFpYzRx?=
 =?utf-8?B?bHJ2S1poS2UycVhDTDYvNEdudWpQMWNYallyWEViZmIvcVc1azBXeUhGZUt0?=
 =?utf-8?B?WFV4aWVJUDRLdUpjYWdxUUZxR3I4Zi9EZG9RaVB6ZVBnN1ZneGRtaEFrQWtO?=
 =?utf-8?B?YURpRk1VR1ZobW1lR1U2NmRNdnBPUWFMTkw3ZytTSG9XVmswTGlXQjI1dDU3?=
 =?utf-8?B?dDZmZDJCVXNBMDNQdWJVMXNsS3JwWHlCeVR0NXZ2TWxvbjRyN0ZpNE5Pckpz?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6da3e0-6649-4429-87c5-08dbcf1c5f95
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB3830.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 14:21:37.6013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lNxi26rl9pwigA9w2Iq5PIJpoeuvDnWrQFachaS1MJELI1ycsl8srmbJ0f3L7TQtrCFCB6eJi914oBs8i2YgpvQ9S5M+V0FiWG09YHVHt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8159
X-Proofpoint-GUID: Qup-9736ub5fdkQidrr4ogbYFXCyYFC2
X-Proofpoint-ORIG-GUID: Qup-9736ub5fdkQidrr4ogbYFXCyYFC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-17_03,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Reason: safe
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 17 Oct 2023 21:42:27 +0000
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
Cc: Jonathan Davies <jonathan.davies@nutanix.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: nutanix.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

We are experiencing strange failures where the audit daemon fails to
start on boot, hitting an ENOBUFS error on its audit_set_pid() call.
This can be reproduced by repeatedly restarting the audit daemon while
the system is under heavy audit load. This also seems to be dependent
on the number of CPUs - we can reproduce this with 2 CPUs but not with
48.

Tracing showed a race between the kernel enabling audit messages to be
sent to the daemon and actually sending the ACK, wherein the socket
buffer could get filled by audit messages before the ACK could be sent,
leading to the ACK being dropped and ENOBUFS set on the socket by
netlink code. A patch to mitigate this race from the kernel side is
separately under discussion on the audit subsystem mailing list:
https://lore.kernel.org/audit/20230922152749.244197-1-chris.riches@nutanix.com/

It's worth noting that this is almost certainly the same issue observed
in this thread from last month (participants CCed):
https://listman.redhat.com/archives/linux-audit/2023-September/020087.html

Here, I am hoping to discuss ACK handling from the userspace side. The
current implementation is a little odd - check_ack() will happily
return success without seeing an ACK if a non-ACK message is top of the
socket queue, but will fail if no message arrives within the timeout.
It also of course fails if ENOBUFS is set on the socket, but this
failure only seems to matter when doing audit_set_pid() - similar
failures during main-loop message processing are logged but otherwise
ignored, as far as I can tell.

I'm not sure I quite understand the intentions of the code, but it
seems odd to let ENOBUFS be a fatal error here, given that it likely
means the socket buffer got flooded with audit messages, and thus
audit_set_pid() succeeded. Perhaps we should just ignore ENOBUFS or
even set NETLINK_NO_ENOBUFS?

It may also be worth increasing the netlink socket buffer size, though
this could only make the issue less likely and would not be sufficient
under arbitrarily heavy audit loads.

Finally, there is another oddity in audit_set_pid() that is tangential
to this discussion but worth highlighting: if the wmode parameter is
WAIT_YES, then there is some additional ACK-handling which waits for
100 milliseconds and eats the top message of the socket queue if one
arrives, without inspecting it. This seems completely wrong as the ACK
will have already been consumed by check_ack() if there was one, and so
the best this code can do is nothing, and at worst (quite likely) it
will swallow a genuine audit message without ever recording it.

- Chris

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

