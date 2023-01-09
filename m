Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA38662A8B
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 16:52:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673279524;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e9O343/ZMaG8DLNKrPOpdhtweqz4du/KiPvInyxDljM=;
	b=QhssVPrIwThl5Ga+JuDa2HeN2pJ5HDmCMcKzzEb1hYLLoEnNty9LBSu5LXiHtYl66YeUWr
	ujlbz+nR7tQDScP7uAOqiMPjm9QPpIWLfQh7ZWmnFu/wXkDvgcNvl4wRbLlRclDJXLb4Ph
	q9KgMrC28IMXARuEemZzpPEFTyeWQko=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-kaUt9OMYOQumd8J4cRNwtw-1; Mon, 09 Jan 2023 10:52:01 -0500
X-MC-Unique: kaUt9OMYOQumd8J4cRNwtw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9242585C6E7;
	Mon,  9 Jan 2023 15:51:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA5EA40C2064;
	Mon,  9 Jan 2023 15:51:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F0CB1194973B;
	Mon,  9 Jan 2023 15:51:48 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E43271946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 15:51:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 53BBE40C2064; Mon,  9 Jan 2023 15:51:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BC4740C2005
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 15:51:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D3B4830F81
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 15:51:47 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-_sG7Oj10NZq0Dz5UFMmZbg-1; Mon, 09 Jan 2023 10:51:45 -0500
X-MC-Unique: _sG7Oj10NZq0Dz5UFMmZbg-1
Received: by mail-pj1-f43.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso13270808pjt.0
 for <linux-audit@redhat.com>; Mon, 09 Jan 2023 07:51:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ph2d+AxF5RBYFDlzFVd2yopVspUYLH4u8znawY80TGo=;
 b=EKHJQwb0lOgvWZ/8o+9gy2/wUaQv8tGjd0jKMGGgNddtwA6kdbXCGxdC0g9egqTFiT
 TQ63tvXhAZ0cPE0rkz/RS7EJpLpR+X1vLQwzIiJDmPuQNaNJTGWNUBhoWHIV0EmSPrn+
 cnY9t74AZItR4ZYVxYvAKMfK33O7Rx2AaQU+pnn73HEzOk5LmnSkOuSI7ze84N23q9ow
 Sx1hdge3FZOJ2UzM6YFcZmZEv7yA+G3tcQII13ybjEh/5vTCZvTh3JuaLxWiFqt5MmOl
 sTZbhjJ3PcQZXdfiaVwfWokdrx/m2Kg7V7cDJbYpND5xdswmuBq946F7iw+49of0BhYo
 bT4w==
X-Gm-Message-State: AFqh2kr//QJCB5uQzXDsGUDWLUl/VdNp/943Ir6zNZQHjL7PviYx2+vX
 qxXoVYIjVftZT7GBlhUfTE6YvSfkio4TlmaQ+f6SIzoIU9BHwlM=
X-Google-Smtp-Source: AMrXdXsKXBAz6YatxhtR3f/7nve6FyOklw7yAH96u+5XR1mUgefycjSbmAFwrdkUAZYDG7QjkCM2pRL0PVv4vGMdER0=
X-Received: by 2002:a17:902:968a:b0:192:7a00:c790 with SMTP id
 n10-20020a170902968a00b001927a00c790mr3861382plp.12.1673279504253; Mon, 09
 Jan 2023 07:51:44 -0800 (PST)
MIME-Version: 1.0
References: <67cb9316477478e1bf04dd65ab90e9171795433d.camel@iinet.net.au>
In-Reply-To: <67cb9316477478e1bf04dd65ab90e9171795433d.camel@iinet.net.au>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Jan 2023 10:51:32 -0500
Message-ID: <CAHC9VhR5tZK+CLjv-MpPsgm5-f1FFKfCxfx8FGpTY7vGMswXoA@mail.gmail.com>
Subject: Re: A question on monitoring time or time management changes in the
 kernel and the adjtimex system call
To: burn@swtf.dyndns.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 9, 2023 at 2:33 AM Burn Alting <burn.alting@iinet.net.au> wrote:
>
> All,
>
> Would it be correct to say that when one sees an adjtimex system call audit event, a change has occurred ONLY if either a AUDIT_TIME_ADJNTPVAL (algorithm change) or AUDIT_TIME_INJOFFSET (time change) record is present in the event?

Looking at audit_log_time() and audit_tk_injoffset() it appears that
an AUDIT_TIME_INJOFFSET record would indicate a time shift given by
the "sec"/"nsec" fields while an AUDIT_TIME_ADJNTPVAL *might* indicate
a shift depending on what was adjusted, you probably want to check the
adjtimex(2) manpage, specifically the struct timex definition for more
information on the AUDIT_TIME_ADJNTPVAL "op" field and "new"/"old"
values.

* https://man7.org/linux/man-pages/man2/adjtimex.2.html

Hopefully that helps a little bit.

--
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

