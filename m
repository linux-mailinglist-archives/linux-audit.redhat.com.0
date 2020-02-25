Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC5116ED59
	for <lists+linux-audit@lfdr.de>; Tue, 25 Feb 2020 18:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582653565;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M2CRaRh19faiv/BxUNzVqbSxbQM+zNKy951lkDWANqY=;
	b=QI2/l+y4xkpr9uayoOj2Rss4nzFlSLhcISsvnmM8Pc9xpN+DHEZdYwbYfjZ2iuro7A6kW3
	UG6jAAuuIxSEpiVlpJ1vIpLwCmGH8VSFs22sTUse0D+hg/IbMr0t5qhXdvjCxyHP/RtcJG
	xhaLauP8FOUMInDXu5GfGLSr0L3BSWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-Ge-WyyASMTSerjWkOefs0Q-1; Tue, 25 Feb 2020 12:59:15 -0500
X-MC-Unique: Ge-WyyASMTSerjWkOefs0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C849800D53;
	Tue, 25 Feb 2020 17:59:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86B9B909EE;
	Tue, 25 Feb 2020 17:59:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A176E18089C8;
	Tue, 25 Feb 2020 17:59:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PHx3K3028782 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 12:59:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EE96610ABC86; Tue, 25 Feb 2020 17:59:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA3A510ABC8C
	for <linux-audit@redhat.com>; Tue, 25 Feb 2020 17:59:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 617A280029B
	for <linux-audit@redhat.com>; Tue, 25 Feb 2020 17:59:00 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-177-wZC5KiFhO2Og_kxlj1JN6Q-1; Tue, 25 Feb 2020 12:58:57 -0500
X-MC-Unique: wZC5KiFhO2Og_kxlj1JN6Q-1
Received: by mail-ed1-f66.google.com with SMTP id m13so417459edb.6
	for <linux-audit@redhat.com>; Tue, 25 Feb 2020 09:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=BxEIbSC0e1HDJNVZhW7dJIgGEJxLhr7xi+KnhXw9bp4=;
	b=UnITOfY8C+1XS7qXHxWMbmFKsafgT/c8hY31+LzQ1q78+PqSLjwOTuuM5NwixWFy2P
	kJwSt9APJAP7RebZ+qoKWk2WTG548Fl1Xm6z1xX8nSAOaoUgYixD5POYdFR+9DMoTcGk
	FFdJvYb2B5JnUMddxVhTFYRPEq0a3v3NPzsOy6FQLzLjsjcYpmFr03VtMP2VK1wLiRg/
	l5FlvOxhFdPrJB6Y7CJU7V+vq72PVtILCF9JB6re7YoP22I6NxL06ILTta+iqq0H0nOM
	S5Ri0wMuTSI2mWiqhwZYIgmzlIzPVrutiA9AOF7OFmQmnFxo5O7NLVOTBm1/puodKllo
	mD8w==
X-Gm-Message-State: APjAAAXEKXdujb+VCNqzDkVUKuGz3d/f7hnZyRNui02EoqsnJOtHYYgE
	LcGDSyfdCXOLS235ptQ9jDwQ95Pcx2EYtmgiKf4RtI8=
X-Google-Smtp-Source: APXvYqylddDNiY6VNlXDnOCoLb5qBquw1T3KMpwHpvztSCsU2SuEG6R+HPB4fofHA6Hy/JrGynjnlZudyuvqfv6MuDU=
X-Received: by 2002:a50:fd15:: with SMTP id i21mr193693eds.12.1582653535985;
	Tue, 25 Feb 2020 09:58:55 -0800 (PST)
MIME-Version: 1.0
References: <158257989798.399121.1279697192021117003.stgit@chester>
In-Reply-To: <158257989798.399121.1279697192021117003.stgit@chester>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 25 Feb 2020 12:58:44 -0500
Message-ID: <CAHC9VhSB7ffF-4Q6-Src=3bdGbiC8ahOvO1Hu7ddZm+LRckGHA@mail.gmail.com>
Subject: Re: [PATCH] audit: fix error handling in audit_data_to_entry()
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PHx3K3028782
X-loop: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 24, 2020 at 4:31 PM Paul Moore <paul@paul-moore.com> wrote:
>
> Commit 219ca39427bf ("audit: use union for audit_field values since
> they are mutually exclusive") combined a number of separate fields in
> the audit_field struct into a single union.  Generally this worked
> just fine because they are generally mutually exclusive.
> Unfortunately in audit_data_to_entry() the overlap can be a problem
> when a specific error case is triggered that causes the error path
> code to attempt to cleanup an audit_field struct and the cleanup
> involves attempting to free a stored LSM string (the lsm_str field).
> Currently the code always has a non-NULL value in the
> audit_field.lsm_str field as the top of the for-loop transfers a
> value into audit_field.val (both .lsm_str and .val are part of the
> same union); if audit_data_to_entry() fails and the audit_field
> struct is specified to contain a LSM string, but the
> audit_field.lsm_str has not yet been properly set, the error handling
> code will attempt to free the bogus audit_field.lsm_str value that
> was set with audit_field.val at the top of the for-loop.
>
> This patch corrects this by ensuring that the audit_field.val is only
> set when needed (it is cleared when the audit_field struct is
> allocated with kcalloc()).  It also corrects a few other issues to
> ensure that in case of error the proper error code is returned.
>
> Cc: stable@vger.kernel.org
> Fixes: 219ca39427bf ("audit: use union for audit_field values since they are mutually exclusive")
> Reported-by: syzbot+1f4d90ead370d72e450b@syzkaller.appspotmail.com
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  kernel/auditfilter.c |   71 +++++++++++++++++++++++++++-----------------------
>  1 file changed, 39 insertions(+), 32 deletions(-)

Merged into audit/stable-5.6, assuming there are no problems I'll send
it up to Linus later this week.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

