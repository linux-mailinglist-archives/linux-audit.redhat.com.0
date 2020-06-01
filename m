Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 278101EA6F5
	for <lists+linux-audit@lfdr.de>; Mon,  1 Jun 2020 17:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591025870;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bYnORDg48O8RXTQjA3hwGPRI5jmuP4ShQpIj4mUtiUM=;
	b=hfPMsk1yGkFyVY7S8efxo42M4ePQY7UvcBHOGelVXuwSoSfFkau7lHDzYhgrgnUB4KaIUa
	99+mUhzzP3aU8ae3l8akYLqh6YHSSl6fef9/cjlqN9mHy8ewSO2sCjONh63M3S6BLUbLry
	wXmN2dfPw3cZKNRp8BE11a0u/56N4Fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-jMJkBN-YOk6pAPNMP0n6fA-1; Mon, 01 Jun 2020 11:37:47 -0400
X-MC-Unique: jMJkBN-YOk6pAPNMP0n6fA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ED9F1902EA2;
	Mon,  1 Jun 2020 15:37:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80EB410190B5;
	Mon,  1 Jun 2020 15:37:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFE131809543;
	Mon,  1 Jun 2020 15:37:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051FaSUF028945 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 11:36:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 063A7105AD50; Mon,  1 Jun 2020 15:36:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFB55105AD4D
	for <linux-audit@redhat.com>; Mon,  1 Jun 2020 15:36:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E133282883A
	for <linux-audit@redhat.com>; Mon,  1 Jun 2020 15:36:25 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-56-AqEluLXkPVGDuXdRg6Z2ig-1; Mon, 01 Jun 2020 11:36:22 -0400
X-MC-Unique: AqEluLXkPVGDuXdRg6Z2ig-1
Received: by mail-ej1-f66.google.com with SMTP id k11so9599734ejr.9
	for <linux-audit@redhat.com>; Mon, 01 Jun 2020 08:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cOzQOgAom9rQmo+hpj4LfsaeGdzJ+MyyfqV630jExfM=;
	b=i3CFtuOOnZK/oEJ1Lc7Gmm8dlecnTfP8yoVV3RsbJXZiVDvon5l7zlGo3WT2xmaE5D
	U+Vw5nppC6C4VsmK3XdPMl+d+z2BHK74ms+lNy0bSsE7jfnse+P4wW8XNeRXbPK2XD4F
	2G9Syq4NniQTSJIfDKjNEz/uLUGzRnjJk1p+tvllH3AJoZBvN45UnvKzVnQ6mI7aQ1Yy
	YHqufEdskKFwqyLbnVzglma8W9ywkIJfKcvRqH1yQ7UAoZI4ALiClk1PWf80oFCGGBsx
	VAHTrU2+Ux+WIFbwBx0XAOfSDq2x5CwGmBWyWFUX593FhsMkIx8MLMlCBKhRjonjzbZd
	1ykg==
X-Gm-Message-State: AOAM533avmnmWxvz7z3uqvQVyn942QkEqGkNIPxFHegY4LhHwQaQSUF2
	b9IHYOF+Cfo3l42PEHMOZzbTQfbEaMVUUiV6nYnd
X-Google-Smtp-Source: ABdhPJxVaLECnW5ysWNl7aGrxxD3Sa6GGI54d7azZ3A9R39oQ9z6eiacAbvYKZ6DiQ+k7L+7xyOd2//IcuQOaHPJrQo=
X-Received: by 2002:a17:906:f1ca:: with SMTP id
	gx10mr2336087ejb.542.1591025780793; 
	Mon, 01 Jun 2020 08:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200524205238.GA17576@embeddedor>
In-Reply-To: <20200524205238.GA17576@embeddedor>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 1 Jun 2020 11:36:09 -0400
Message-ID: <CAHC9VhRcpqs6TGoqK_soTz8Jo5BCDfhq1kqKGGJeJpbXhWZRsg@mail.gmail.com>
Subject: Re: [PATCH] audit: Use struct_size() helper in alloc_chunk
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, May 24, 2020 at 4:47 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
>
> struct audit_chunk {
>         ...
>         struct node {
>                 struct list_head list;
>                 struct audit_tree *owner;
>                 unsigned index;         /* index; upper bit indicates 'will prune' */
>         } owners[];
> };
>
> Make use of the struct_size() helper instead of an open-coded version
> in order to avoid any potential type mistakes.
>
> So, replace the following form:
>
> offsetof(struct audit_chunk, owners) + count * sizeof(struct node);
>
> with:
>
> struct_size(chunk, owners, count)
>
> This code was detected with the help of Coccinelle.
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  kernel/audit_tree.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Thanks, this looks reasonable to me, but it came in too late for the
v5.8 merge window (I dislike taking changes past -rc5/6 unless
critical).  Once the merge window closes I'll merge this into
audit/next.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

