Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9812F1FD651
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jun 2020 22:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592426749;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U2MUsA9FlYO4yRn7sncCbwq6RX9D/F4bIHOMewfTlug=;
	b=HMzvs4PFCunutg/+LA65uLrwrohqKmcua44sRUteJkyYRpekVp8lAoNW5Tq8lZHEa8pdnz
	GdjXJJeaGnt9m6oPvlkVOGulQagGE2QPODQ2XUi7jk6XcBPZ4qyRLJBY/Vo/E14JvQ4IM8
	JHGQKQS2NxKdBWi3YFHCukO8ut5O7pU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-7GZOzVooND63MMFM4x0ObQ-1; Wed, 17 Jun 2020 16:45:47 -0400
X-MC-Unique: 7GZOzVooND63MMFM4x0ObQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CC1F835B44;
	Wed, 17 Jun 2020 20:45:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A919660BF4;
	Wed, 17 Jun 2020 20:45:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1815833C6;
	Wed, 17 Jun 2020 20:45:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HKjQKT031021 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 16:45:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E7282026E04; Wed, 17 Jun 2020 20:45:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8906C201E7C1
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 20:45:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F1D6858EE2
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 20:45:21 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-195-x26CHbCfOoiCHNVF_kKX3w-1; Wed, 17 Jun 2020 16:45:18 -0400
X-MC-Unique: x26CHbCfOoiCHNVF_kKX3w-1
Received: by mail-ej1-f68.google.com with SMTP id k11so4032465ejr.9
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 13:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Oj0P5buG5a1bC8JEmblF7aFxCNxNLKAs2Jf9eLodu5c=;
	b=KBL0vWttOiF6MzNYWzajS7EbBhdhoLeGGx6z1jHlS1HNALQZuMAlaQ5wzJ5oIPVv1c
	LtWLjr7tM5BU1pHfUdFoiWF0Vd7Lop98Ru4T7bu7jJ2GlicZucLZ8vfO/uf5jo1kWiv0
	emb9+uD9qlMsxSIj31U1LiUZAAYSH/509NAPFs55wyzx1pIvOstghzh1b4DhvPY+Ljkd
	cWvFEy/e9hTGKTwLlEyUJ/yoegJy0Vs2o9neiJsYovmRvBz/f9IiSVwGi8IYIYSwnu/t
	c5T7T08Jp+QlKYEfybLDM9kCivrUSHPelZ3bSJEICDgzJilZNkMmY+5wvosJaw5fktqo
	sZ+Q==
X-Gm-Message-State: AOAM530cXyi3d4RBkrXjRzY0jlnJWdC3FYRlUYjbYyfbfaKDeCvqNiPR
	xLzw3uq4iInVLZL3mE9RhKbuJlpHHEiS3IkPMeFJ
X-Google-Smtp-Source: ABdhPJzw32d9FudDP8frZbB2vJBeBaF2R0077RjX1lAaOHcpgPSX6JRBm4RBGrfBH6KBQ91p8p6btsutMwMNtJFCSSc=
X-Received: by 2002:a17:906:ecef:: with SMTP id
	qt15mr908152ejb.91.1592426717104; 
	Wed, 17 Jun 2020 13:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200524205238.GA17576@embeddedor>
	<CAHC9VhRcpqs6TGoqK_soTz8Jo5BCDfhq1kqKGGJeJpbXhWZRsg@mail.gmail.com>
In-Reply-To: <CAHC9VhRcpqs6TGoqK_soTz8Jo5BCDfhq1kqKGGJeJpbXhWZRsg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Jun 2020 16:45:05 -0400
Message-ID: <CAHC9VhSP6-eMHzZ3=-EX12fACMCSCddP9hN+58DuKNiOXMP-aw@mail.gmail.com>
Subject: Re: [PATCH] audit: Use struct_size() helper in alloc_chunk
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 1, 2020 at 11:36 AM Paul Moore <paul@paul-moore.com> wrote:
> On Sun, May 24, 2020 at 4:47 PM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> > One of the more common cases of allocation size calculations is finding
> > the size of a structure that has a zero-sized array at the end, along
> > with memory for some number of elements for that array. For example:
> >
> > struct audit_chunk {
> >         ...
> >         struct node {
> >                 struct list_head list;
> >                 struct audit_tree *owner;
> >                 unsigned index;         /* index; upper bit indicates 'will prune' */
> >         } owners[];
> > };
> >
> > Make use of the struct_size() helper instead of an open-coded version
> > in order to avoid any potential type mistakes.
> >
> > So, replace the following form:
> >
> > offsetof(struct audit_chunk, owners) + count * sizeof(struct node);
> >
> > with:
> >
> > struct_size(chunk, owners, count)
> >
> > This code was detected with the help of Coccinelle.
> >
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  kernel/audit_tree.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
>
> Thanks, this looks reasonable to me, but it came in too late for the
> v5.8 merge window (I dislike taking changes past -rc5/6 unless
> critical).  Once the merge window closes I'll merge this into
> audit/next.

FYI, I just merged this into audit/next.  Thanks!

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

