Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B843317CA3A
	for <lists+linux-audit@lfdr.de>; Sat,  7 Mar 2020 02:18:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583543920;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zyY7R1VXCcDgA9BvQi+vBnB56OpX8L/50UIutidqkI0=;
	b=HVS/QSArj4kAXYj2/MB8Xq5tvC7o+bO5WhNdwAIXdAGl10pN9MBNQeL69ShLuC2j41csxQ
	hJ4KLkgbRaLTy4+eC5ZGNfC23ldQsANn1QlA0YXv2I+hVt1YdybznVyxa5M2HcJW12ZBFI
	u9BO/jQ0M3A+m6zaJQztSJScvnGoBYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-qx6WBg67P2iZX4W0Q-IDBw-1; Fri, 06 Mar 2020 20:18:37 -0500
X-MC-Unique: qx6WBg67P2iZX4W0Q-IDBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20805800D4E;
	Sat,  7 Mar 2020 01:18:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2D425D9CD;
	Sat,  7 Mar 2020 01:18:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 327B284481;
	Sat,  7 Mar 2020 01:18:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0271I7DQ015190 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 20:18:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9526E2166B28; Sat,  7 Mar 2020 01:18:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 912442166B2B
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 01:18:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE8EF8007A4
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 01:18:05 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-187-1a5qWIhCO6624tBWe2Smdg-1; Fri, 06 Mar 2020 20:18:03 -0500
X-MC-Unique: 1a5qWIhCO6624tBWe2Smdg-1
Received: by mail-ed1-f66.google.com with SMTP id n18so4627391edw.9
	for <linux-audit@redhat.com>; Fri, 06 Mar 2020 17:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZCcsrdxlA0Tss7ylBfiR/xvYKY21YSAeYRTPug2XsyE=;
	b=HtnUoSpu7XJVvYsFz98I+hg2azPNri3grxmQId1ZqjGvrk8Gg9S9E9If5P0TMDPKKe
	3cL/qwdB7DVm6RjcvluvL2u+0zYWZpBEQGeZRjAeNfAtx/72llm1o1HO0wxKf9BEPEKC
	d52zXVDxfTQ30RXTj8z754DeKUZa+mO4bOsqftrc44V2qQELe2eBtJUV4zhTdvk1E95I
	0fONde0rVm9tbCF7h54sMhaFzQ6dPeR4+sFeXFm0+9CxqdkhqUrip8y9Welpt6K7sRAf
	JchtK1iOLMhB6G0XBfTBciHppuMLBymQhcUQNjuouyoAjzV/xgfufLJF8ekCEL+bOPgH
	LKGQ==
X-Gm-Message-State: ANhLgQ1HYDf7bQIehh6Iq2PfhK5/WOZpKUKTaI1b5K0Q78fg+mBiN7JK
	cnTmkVlilvxk/wqUpchqbWQzwcAaTlNyHvNpFJG7mAE=
X-Google-Smtp-Source: ADFU+vtC0ODg5jlDa7p3klF+OjFMq3RwCreuWXrI7cvUYsTf/9+Ti0r25GZxRXMGeak8JcIARpSbCW/bnkhT+URxxEU=
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr6268817edc.128.1583543881618; 
	Fri, 06 Mar 2020 17:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-5-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-5-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Mar 2020 20:17:50 -0500
Message-ID: <CAHC9VhS-m1xfszEuCS+DqZMU8WQJWaVnWpeqESHcXzwviFV03A@mail.gmail.com>
Subject: Re: [PATCH v15 07/23] LSM: Use lsmblob in security_secid_to_secctx
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0271I7DQ015190
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2020 at 7:05 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change security_secid_to_secctx() to take a lsmblob as input
> instead of a u32 secid. It will then call the LSM hooks
> using the lsmblob element allocated for that module. The
> callers have been updated as well. This allows for the
> possibility that more than one module may be called upon
> to translate a secid to a string, as can occur in the
> audit code.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> cc: netdev@vger.kernel.org
> ---
>  drivers/android/binder.c                |  4 +++-
>  include/linux/security.h                |  5 +++--
>  include/net/scm.h                       |  5 ++---
>  kernel/audit.c                          |  9 +++++++--
>  kernel/auditsc.c                        | 14 ++++++++++----
>  net/ipv4/ip_sockglue.c                  |  3 +--
>  net/netfilter/nf_conntrack_netlink.c    |  8 ++++++--
>  net/netfilter/nf_conntrack_standalone.c |  4 +++-
>  net/netfilter/nfnetlink_queue.c         |  8 ++++++--
>  net/netlabel/netlabel_unlabeled.c       | 18 ++++++++++++++----
>  net/netlabel/netlabel_user.c            |  6 +++---
>  security/security.c                     | 16 +++++++++++++---
>  12 files changed, 71 insertions(+), 29 deletions(-)

More of the lsmblob_init()/dosomething() pattern.

I'm sure this will all change later (and peeking ahead, it looks like
most of it does), but I think it needs to be better documented in
these commits about what is temporary and what is intended to stick
around.  Imagine years later bisecting down to this patch and trying
to make sense of why it was done this way.

I realize that it is hard to make individual patches do something
meaningful when you are making such sweeping changes, but in these
cases you need to document it until there is no doubt about why this
patch exists.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

