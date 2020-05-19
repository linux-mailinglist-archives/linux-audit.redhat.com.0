Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C1F761DA0DC
	for <lists+linux-audit@lfdr.de>; Tue, 19 May 2020 21:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589915957;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KrqlPduE6ABg7Dl2kXF1stLlzdPrAYt0JN5uMwOXVEk=;
	b=E5nqNR3ftXZ/AGicXn6T83GxK9nP2qArENIoo/Ajtk2yUT6n1RqhF+SJaiflNqoQCSPOV6
	Rm2kxe9GY3ldUzrLRT71iRpsyqwLlB1lxz3yD4CidKYlYb/D3PUXgP5LeYtfnw6LU92MJ/
	d8gDzTYSxdkjW5RDnlNWRYfBuLXhfE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-bWz8s35yOHiRDnEt1FlK0g-1; Tue, 19 May 2020 15:19:13 -0400
X-MC-Unique: bWz8s35yOHiRDnEt1FlK0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B199107AFAF;
	Tue, 19 May 2020 19:19:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B951F5C1BB;
	Tue, 19 May 2020 19:19:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B45C4ED87;
	Tue, 19 May 2020 19:18:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JJIeqi020797 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 15:18:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CDF7210CD917; Tue, 19 May 2020 19:18:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C90E210CD915
	for <linux-audit@redhat.com>; Tue, 19 May 2020 19:18:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82B28101A525
	for <linux-audit@redhat.com>; Tue, 19 May 2020 19:18:38 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-36-iwuf1OdkP_qj7owPxlmz2w-1; Tue, 19 May 2020 15:18:36 -0400
X-MC-Unique: iwuf1OdkP_qj7owPxlmz2w-1
Received: by mail-ej1-f67.google.com with SMTP id a2so255076ejb.10
	for <linux-audit@redhat.com>; Tue, 19 May 2020 12:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pwDvf5G6HSaQ20Oxj0p6X54Wu/x0ouoEho2X1JQouNk=;
	b=cbvCYIwHtHG5zUqhGfz5JbOGP/k0o/rCWUZXABWX5JlSDHlSUJglR1TEN+uBYt2KKj
	JgYHUpcQ/Cno7totxuvRwNqDkPSLGWtmL7TcAe3FunyUipBt8dqYW1iBXfBVlIV4IOXx
	cAdGWjZemDrjuZNC9lTtCriFvespQxC/FVjVBaRkCIAPp7CbWxnGVLGSbMnhAeUWJLPW
	Ut+wx3B4Z4bp+vAL0MoS1PJ0WE/qGJjVJLT4pHzqY7ZmguJqBzLKt2dn11JeGbfZ/8cT
	jG2ilq2gbgBcDZHX/f+3fvdCv8SDz+00Wm6FyL2tfoBbxDwQY2maEIE2euTFxNm/3Ze6
	vH+w==
X-Gm-Message-State: AOAM530O5d8af0DA/30rUxbTlLkMKisN9IYSroI1llnnHNf9l99WPU/a
	y/e3BqyQfblEqakHa2iACEuuMYWJAnIxaAVx6Eb8
X-Google-Smtp-Source: ABdhPJwIXuucs0DGivH6PwCdg07KxPMElgAI2ADtY9VUQAv/qt4fe3j2mqb2tBpIQWZ5V2ksbjrenTScUT/dJ6h48BY=
X-Received: by 2002:a17:907:40f1:: with SMTP id
	no1mr689589ejb.178.1589915914530; 
	Tue, 19 May 2020 12:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <2794b22c0b88637a4270b346e52aeb8db7f59457.1589853445.git.rgb@redhat.com>
In-Reply-To: <2794b22c0b88637a4270b346e52aeb8db7f59457.1589853445.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 19 May 2020 15:18:23 -0400
Message-ID: <CAHC9VhQYUooJbZ9tcOOwb=48LTjtnfo0g11vQuyLzoxdetaxnw@mail.gmail.com>
Subject: Re: [PATCH ghak25 v5] audit: add subj creds to NETFILTER_CFG record
	to cover async unregister
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 19, 2020 at 11:31 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Some table unregister actions seem to be initiated by the kernel to
> garbage collect unused tables that are not initiated by any userspace
> actions.  It was found to be necessary to add the subject credentials to
> cover this case to reveal the source of these actions.  A sample record:
>
> The tty, ses and exe fields have not been included since they are in the
> SYSCALL record and contain nothing useful in the non-user context.
>
>   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2

Based on where things were left in the discussion on the previous
draft, I think it would be good if you could explain a bit why the uid
and auid fields are useful here.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

