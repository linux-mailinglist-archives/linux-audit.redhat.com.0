Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 71C401833C8
	for <lists+linux-audit@lfdr.de>; Thu, 12 Mar 2020 15:52:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584024735;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ckWC0qjfxI/NInvfbvRz0G7YW/EH7WrlNN0lrrTD/EM=;
	b=VA3ie2S0z3sQaAa7w7fhL3yngTemYOyYpWowU6MvY8gD0diM3Nsjh1X/2/ehvdvf7JYHXC
	J8wZ8mVYxfLAiOJenpxo7F+GmNJXvDHzQVHqqwwAPO+XmaKN5l6hABeTVRrNKlnOIGG8Ay
	/+1ukwg8rqy25p/lGFVrzIc523vSpb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-OglsX_mmMUGL8fwEBSMd9Q-1; Thu, 12 Mar 2020 10:52:12 -0400
X-MC-Unique: OglsX_mmMUGL8fwEBSMd9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DDEE1083E8C;
	Thu, 12 Mar 2020 14:52:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FA9660BEC;
	Thu, 12 Mar 2020 14:52:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 481F285ECB;
	Thu, 12 Mar 2020 14:51:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02CEpeDH025211 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 12 Mar 2020 10:51:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4560B2026D67; Thu, 12 Mar 2020 14:51:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40DF62037E43
	for <linux-audit@redhat.com>; Thu, 12 Mar 2020 14:51:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75515800897
	for <linux-audit@redhat.com>; Thu, 12 Mar 2020 14:51:37 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-5-whykd4vJM1iSF834yu4gpQ-1; Thu, 12 Mar 2020 10:51:34 -0400
X-MC-Unique: whykd4vJM1iSF834yu4gpQ-1
Received: by mail-ed1-f67.google.com with SMTP id i24so3889009eds.1
	for <linux-audit@redhat.com>; Thu, 12 Mar 2020 07:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ypR/CP4OK72Ocf5cUDOgln51pBdE6rRH8h/xtZQZbe4=;
	b=BQkaIVW/2IfWqZchkST3/oAgYAXPJQMKQ5Pt6mBX8angjo4dcXVXRboRAauKWgg5J6
	54hofxmCPOt/0FrRdvI66ODVLnDB3J7nIJ0JIGDpIL0zMgWZRnbRS6z2ouSBxceugxpy
	/vJ/iJB+hfnJFP6eQ6JlQwqFtgpBuG7DABryUvgml4MimX8fLJ4GFVwUmKxYM1q70uUG
	t78JQuGl4wGqTQEMXSLfQ5WrDN/ZVUY5R2kGElei3Z2ITXucEag9NWJ13Zb1VvWJnNuH
	O7pokTgONf0o59UkZYOOtu1w9LbIj02NAi+5l/BFeLdaf/mJtBZ+nqAuh7f7LWWYjR+q
	Osbw==
X-Gm-Message-State: ANhLgQ3NYZW2dY19LsepqWOKeNN3fSwRnXd0N/1rr2/8rjrY9lXrhwsQ
	plK3C57aLOnLaZiolbjr8t9sJ4Jn0tyuqbqf6QOLqoc=
X-Google-Smtp-Source: ADFU+vvUIS5mgc3hdZW3KVgyR0N8eC5HlQrLKiexau837ObSCAf4b7CyefwcQYij+QdMZREevQNeSgyiAg/Quf/Alc8=
X-Received: by 2002:a17:906:3607:: with SMTP id
	q7mr6940559ejb.308.1584024692633; 
	Thu, 12 Mar 2020 07:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <199b556aae531db6e08f2711b1751e976f8bd48a.1583801740.git.rgb@redhat.com>
In-Reply-To: <199b556aae531db6e08f2711b1751e976f8bd48a.1583801740.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 12 Mar 2020 10:51:21 -0400
Message-ID: <CAHC9VhQhO6Srbs=ivb5j2HLmAW1aA+Ju6hpyxUCovT7gm3kJjQ@mail.gmail.com>
Subject: Re: [PATCH V2 ghak120] audit: trigger accompanying records when no
	rules present
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02CEpeDH025211
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@parisplace.org>
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

On Tue, Mar 10, 2020 at 9:21 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> When there are no audit rules registered, mandatory records (config,
> etc.) are missing their accompanying records (syscall, proctitle, etc.).
>
> This is due to audit context dummy set on syscall entry based on absence
> of rules that signals that no other records are to be printed.
>
> Clear the dummy bit if any record is generated.
>
> The proctitle context and dummy checks are pointless since the
> proctitle record will not be printed if no syscall records are printed.
>
> Please see upstream github issue
> https://github.com/linux-audit/audit-kernel/issues/120
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Chagelog:
> v2:
> - unconditionally clear dummy
> - create audit_clear_dummy accessor function
> - remove proctitle context and dummy checks
> ---
>  kernel/audit.c   | 1 +
>  kernel/audit.h   | 8 ++++++++
>  kernel/auditsc.c | 3 ---
>  3 files changed, 9 insertions(+), 3 deletions(-)

Merged into audit/next, thanks.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

