Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EB4A0E4798
	for <lists+linux-audit@lfdr.de>; Fri, 25 Oct 2019 11:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571996581;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LDcNeH1fncEVgOfYGn1ohFAJUSI1ATABPb/CmCCA17M=;
	b=cRlmoV13f8cXQ37XX7b5kdYJgtsopcEIxUb62fpJ5db4Jf8Q93WL+Jr36M0Gy259S71a5w
	Xw0MYCv36a1MaP53vnnCt8u0j/7jfdO3s/kzW/TTSG2yvtvfPOBcYQqIrNkM4+85dojuMP
	alkF1GA0sRvk+vWV/eYN7mASAbPpxP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-b5CTG63-OkGh3DacTO2awg-1; Fri, 25 Oct 2019 05:42:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D0035EC;
	Fri, 25 Oct 2019 09:42:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B83D60A97;
	Fri, 25 Oct 2019 09:42:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCF4E1803B49;
	Fri, 25 Oct 2019 09:42:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9P7EwVF013661 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 03:14:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 610CF61B63; Fri, 25 Oct 2019 07:14:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A7535D9CA;
	Fri, 25 Oct 2019 07:14:54 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A4C53082A6C;
	Fri, 25 Oct 2019 07:14:52 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 3B05BC9B8F20A4332C18;
	Fri, 25 Oct 2019 15:14:50 +0800 (CST)
Received: from [127.0.0.1] (10.177.251.225) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 25 Oct 2019 15:14:44 +0800
Subject: Re: [PATCH] audit: remove redundant condition check in
	kauditd_thread()
To: Paul Moore <paul@paul-moore.com>, <eparis@redhat.com>
References: <7869bb43-5cb1-270a-07d1-31574595e13e@huawei.com>
	<16e0170d878.280e.85c95baa4474aabc7814e68940a78392@paul-moore.com>
From: Yunfeng Ye <yeyunfeng@huawei.com>
Message-ID: <a700333e-53b8-1a28-b27d-2ba3f612df2a@huawei.com>
Date: Fri, 25 Oct 2019 15:14:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <16e0170d878.280e.85c95baa4474aabc7814e68940a78392@paul-moore.com>
Content-Language: en-US
X-Originating-IP: [10.177.251.225]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Fri, 25 Oct 2019 07:14:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 25 Oct 2019 07:14:53 +0000 (UTC) for IP:'45.249.212.190'
	DOMAIN:'szxga04-in.huawei.com' HELO:'huawei.com'
	FROM:'yeyunfeng@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.190 szxga04-in.huawei.com
	45.249.212.190 szxga04-in.huawei.com <yeyunfeng@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 25 Oct 2019 05:42:32 -0400
Cc: hushiyuan@huawei.com, linfeilong@huawei.com, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
X-MC-Unique: b5CTG63-OkGh3DacTO2awg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable



On 2019/10/25 13:43, Paul Moore wrote:
> On October 23, 2019 3:27:50 PM Yunfeng Ye <yeyunfeng@huawei.com> wrote:
>> Warning is found by the code analysis tool:
>>  "the condition 'if(ac && rc < 0)' is redundant: ac"
>>
>>
>> The @ac variable has been checked before. It can't be a null pointer
>> here, so remove the redundant condition check.
>>
>>
>> Signed-off-by: Yunfeng Ye <yeyunfeng@huawei.com>
>> ---
>> kernel/audit.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> Hello,
>=20
> Thank you for the patch.  Looking quickly at it, it appears to be correct=
, unfortunately I'm not in a position to merge non-critical patches, but I =
expect to merge this next week.
>=20
ok, thanks.

>=20
>> diff --git a/kernel/audit.c b/kernel/audit.c
>> index da8dc0db5bd3..193f3a1f4425 100644
>> --- a/kernel/audit.c
>> +++ b/kernel/audit.c
>> @@ -830,7 +830,7 @@ static int kauditd_thread(void *dummy)
>>  rc =3D kauditd_send_queue(sk, portid,
>>  &audit_hold_queue, UNICAST_RETRIES,
>>  NULL, kauditd_rehold_skb);
>> - if (ac && rc < 0) {
>> + if (rc < 0) {
>>  sk =3D NULL;
>>  auditd_reset(ac);
>>  goto main_queue;
>> @@ -840,7 +840,7 @@ static int kauditd_thread(void *dummy)
>>  rc =3D kauditd_send_queue(sk, portid,
>>  &audit_retry_queue, UNICAST_RETRIES,
>>  NULL, kauditd_hold_skb);
>> - if (ac && rc < 0) {
>> + if (rc < 0) {
>>  sk =3D NULL;
>>  auditd_reset(ac);
>>  goto main_queue;
>> --
>> 2.7.4.3
>=20
> --
> paul moore
> www.paul-moore.com
>=20
>=20
>=20
>=20
>=20
>=20

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

