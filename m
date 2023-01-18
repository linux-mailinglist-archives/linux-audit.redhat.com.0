Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D0F671E97
	for <lists+linux-audit@lfdr.de>; Wed, 18 Jan 2023 14:56:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674050177;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=29R8KfgK9oqD9Wcqv+knXT/WCTHj98MFcpmcBzo2C2M=;
	b=LOCooQ1MpMd3Ufl/YCYLe+OBLPURHv2wkikU5XKScWKDRff3BxO5u/TPrNeLwVVQwh91/l
	u/gvZssUf1G0Jwun3OYGS8zS7Hndcqrf4kYaw0uzJZe5PtUl96zNqC7xBrMaWvxiA8aHNf
	RuGGlM3weFXNF6/XYSg5rJbmywTiuok=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-5x78NzGTM92eEemzHojNYQ-1; Wed, 18 Jan 2023 08:56:15 -0500
X-MC-Unique: 5x78NzGTM92eEemzHojNYQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77AED3828888;
	Wed, 18 Jan 2023 13:56:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E13A492B00;
	Wed, 18 Jan 2023 13:56:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 063711946A71;
	Wed, 18 Jan 2023 13:56:03 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DAEA819465B7 for <linux-audit@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 08:48:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8618A1121318; Wed, 18 Jan 2023 08:48:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F1281121315
 for <linux-audit@redhat.com>; Wed, 18 Jan 2023 08:48:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FC0D101A52E
 for <linux-audit@redhat.com>; Wed, 18 Jan 2023 08:48:11 +0000 (UTC)
Received: from fx304.security-mail.net (smtpout30.security-mail.net
 [85.31.212.34]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-YtBII5XjP4SFdZH5bI9dVQ-1; Wed, 18 Jan 2023 03:48:06 -0500
X-MC-Unique: YtBII5XjP4SFdZH5bI9dVQ-1
Received: from localhost (localhost [127.0.0.1])
 by fx304.security-mail.net (Postfix) with ESMTP id 6E43E9D03A
 for <linux-audit@redhat.com>; Wed, 18 Jan 2023 09:48:05 +0100 (CET)
Received: from fx304 (localhost [127.0.0.1]) by fx304.security-mail.net
 (Postfix) with ESMTP id 534809D021; Wed, 18 Jan 2023 09:48:05 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx304.security-mail.net (Postfix) with ESMTPS id B70559D065; Wed, 18 Jan
 2023 09:48:04 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 8AA0D27E0431; Wed, 18 Jan 2023
 09:48:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 6F12027E0430; Wed, 18 Jan 2023 09:48:04 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 wmXiccehnwry; Wed, 18 Jan 2023 09:48:04 +0100 (CET)
Received: from [127.0.0.1] (unknown [192.168.37.161]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 0848227E042C; Wed, 18 Jan 2023 09:48:03 +0100
 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <1338a.63c7b244.b5e0c.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 6F12027E0430
Message-ID: <eaba8723-606b-4f77-c647-afb3071f7496@kalray.eu>
Date: Wed, 18 Jan 2023 09:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 02/25] kvx: Add ELF-related definitions
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <20230103164359.24347-3-ysionneau@kalray.eu>
 <875ydnmhcv.fsf@email.froward.int.ebiederm.org>
From: Yann Sionneau <ysionneau@kalray.eu>
In-Reply-To: <875ydnmhcv.fsf@email.froward.int.ebiederm.org>
X-ALTERMIMEV2_out: done
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Wed, 18 Jan 2023 13:55:58 +0000
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
Cc: linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 linux-mm@kvack.org, linux-audit@redhat.com,
 Clement Leger <clement.leger@bootlin.com>, Kees Cook <keescook@chromium.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-us
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 03/01/2023 22:35, Eric W. Biederman wrote:
> Yann Sionneau <ysionneau@kalray.eu> writes:
>
>> Add ELF-related definitions for kvx, including: EM_KVX,
>> AUDIT_ARCH_KVX and NT_KVX_TCA.
> Has someone written an SYSVABI architecture specification for
> your architecture?

Internally at Kalray we have an ABI document, I started a discussion 
about its publication.

It will not be part of the V2, but I'm working on it.

>
> I feel uncomfortable with the linux-kernel headers being the
> authoritative place for the ELF abi definitions.
>
> Especially since the linux kernel does not deal with relocations,
> and the kernel headers could diverge from the real world and no one
> would notice..
>
> I know at least at one point the linux standards base was taking
> up the work on collecting up some of these definitions.  I would
> be happy if there was anything outside of the linux kernel that
> people could refer too.

I completely agree with you!

Thanks for the review.

-- 

Yann





--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

