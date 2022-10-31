Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B226134E5
	for <lists+linux-audit@lfdr.de>; Mon, 31 Oct 2022 12:49:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667216973;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gbhhH66SsIkflDJKpxGfD+rZKl3hKADdJTyTnm3BTgc=;
	b=d1LwP3lE8FWNzyx49UdX8c8p7Fuso5J+kAozQp9V/mZTiMYJ3FXQzU08GdZz93e8sFB7cE
	A6pn0HVwdAKoJdmM0XsWrqi4RfnrL20zeFEo5pOs0PcOUpwGRYTwQlzQJZT8fcXuk9Ccrn
	g4PcgJUQdnjqMheqLQn+I7X6L5hoNaA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-Z22oUYHvO1qGMkX76pklTQ-1; Mon, 31 Oct 2022 07:49:30 -0400
X-MC-Unique: Z22oUYHvO1qGMkX76pklTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E66A087B2A0;
	Mon, 31 Oct 2022 11:49:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AB1040C6EC6;
	Mon, 31 Oct 2022 11:49:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8071B19465B1;
	Mon, 31 Oct 2022 11:49:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D6E81194658C for <linux-audit@listman.corp.redhat.com>;
 Mon, 31 Oct 2022 11:49:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BA53C2166B2F; Mon, 31 Oct 2022 11:49:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B19DC2166B29
 for <linux-audit@redhat.com>; Mon, 31 Oct 2022 11:49:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9425129DD994
 for <linux-audit@redhat.com>; Mon, 31 Oct 2022 11:49:25 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-M8lEAWM-PdC4GO8FFvv-vQ-1; Mon, 31 Oct 2022 07:49:21 -0400
X-MC-Unique: M8lEAWM-PdC4GO8FFvv-vQ-1
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N1BDV6S25zpW7D;
 Mon, 31 Oct 2022 19:45:46 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 19:49:17 +0800
Subject: Re: [PATCH] audit: fix undefined behavior in bit shift for AUDIT_BIT
To: Paul Moore <paul@paul-moore.com>
References: <20221031021021.3888564-1-cuigaosheng1@huawei.com>
 <CAHC9VhQ2q0rA_OtL9VZm=dMLwMKu2cME3bC2LEzTBa3A-XsQbg@mail.gmail.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <5e5ce295-5ef1-0248-8265-886d2d0067f7@huawei.com>
Date: Mon, 31 Oct 2022 19:49:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQ2q0rA_OtL9VZm=dMLwMKu2cME3bC2LEzTBa3A-XsQbg@mail.gmail.com>
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: arnd@arndb.de, paulmck@kernel.org, eparis@redhat.com, dhowells@redhat.com,
 linux-audit@redhat.com, mtk.manpages@gmail.com, tglx@linutronix.de
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

> Thanks, this patch looks good, although the 'Fixes:' line above isn't
> correct.  The commit you reference may be the commit which created
> AUDIT_BIT in include/uapi/linux/audit.h, but before that it was
> defined in include/linux/audit.h with the original implementation
> shipping in v2.6.6-rc1.  As the original AUDIT_BIT implementation
> predates git itself, I would suggest removing the 'Fixes' line
> entirely and I'll simply add the usual stable marking when I merge it
> into audit/stable-6.1.  If that is okay with you I'll go ahead and
> merge this patch which that tweak - is that okay?

Yes, you are right, thanks for taking time to review this patch!

On 2022/10/31 19:34, Paul Moore wrote:
> On Sun, Oct 30, 2022 at 10:10 PM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
>> Shifting signed 32-bit value by 31 bits is undefined, so changing
>> significant bit to unsigned. The UBSAN warning calltrace like below:
>>
>> UBSAN: shift-out-of-bounds in kernel/auditfilter.c:179:23
>> left shift of 1 by 31 places cannot be represented in type 'int'
>> Call Trace:
>>   <TASK>
>>   dump_stack_lvl+0x7d/0xa5
>>   dump_stack+0x15/0x1b
>>   ubsan_epilogue+0xe/0x4e
>>   __ubsan_handle_shift_out_of_bounds+0x1e7/0x20c
>>   audit_register_class+0x9d/0x137
>>   audit_classes_init+0x4d/0xb8
>>   do_one_initcall+0x76/0x430
>>   kernel_init_freeable+0x3b3/0x422
>>   kernel_init+0x24/0x1e0
>>   ret_from_fork+0x1f/0x30
>>   </TASK>
>>
>> Fixes: 607ca46e97a1 ("UAPI: (Scripted) Disintegrate include/linux")
> Thanks, this patch looks good, although the 'Fixes:' line above isn't
> correct.  The commit you reference may be the commit which created
> AUDIT_BIT in include/uapi/linux/audit.h, but before that it was
> defined in include/linux/audit.h with the original implementation
> shipping in v2.6.6-rc1.  As the original AUDIT_BIT implementation
> predates git itself, I would suggest removing the 'Fixes' line
> entirely and I'll simply add the usual stable marking when I merge it
> into audit/stable-6.1.  If that is okay with you I'll go ahead and
> merge this patch which that tweak - is that okay?
>
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> ---
>>   include/uapi/linux/audit.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
>> index 7c1dc818b1d5..d676ed2b246e 100644
>> --- a/include/uapi/linux/audit.h
>> +++ b/include/uapi/linux/audit.h
>> @@ -187,7 +187,7 @@
>>   #define AUDIT_MAX_KEY_LEN  256
>>   #define AUDIT_BITMASK_SIZE 64
>>   #define AUDIT_WORD(nr) ((__u32)((nr)/32))
>> -#define AUDIT_BIT(nr)  (1 << ((nr) - AUDIT_WORD(nr)*32))
>> +#define AUDIT_BIT(nr)  (1U << ((nr) - AUDIT_WORD(nr)*32))
>>
>>   #define AUDIT_SYSCALL_CLASSES 16
>>   #define AUDIT_CLASS_DIR_WRITE 0
>> --
>> 2.25.1
> --
> paul-moore.com
>
> .

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

