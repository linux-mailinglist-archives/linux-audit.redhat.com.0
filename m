Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AD2221BCFE9
	for <lists+linux-audit@lfdr.de>; Wed, 29 Apr 2020 00:27:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588112852;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y3ENksKOd04zTzzhfGF/+Wtd3VXvS04em5iL6hnVeUc=;
	b=Hs8AhlwB/onHMbg4xNkZcgdY18zIZHa5MUHZmPvB836tjWAb+79WIfLLtABTBPdCpK/CRq
	GalFjbWn7HR1xjiMvbVH2UeqP6isv2eZpiq5yg6+2SOSZQo99LS03w11DDlHi3lCu+RUoZ
	l/tUAKZYkk+PjtYgs83SMbmnHtkkQqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-bEv9tezgNYaTqlDFtbvKIw-1; Tue, 28 Apr 2020 18:27:30 -0400
X-MC-Unique: bEv9tezgNYaTqlDFtbvKIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D93AC53;
	Tue, 28 Apr 2020 22:27:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43AC1614C0;
	Tue, 28 Apr 2020 22:27:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A0944CA94;
	Tue, 28 Apr 2020 22:27:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SMQAjm024639 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 18:26:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 814A3C611E; Tue, 28 Apr 2020 22:26:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D7B1C223E
	for <linux-audit@redhat.com>; Tue, 28 Apr 2020 22:26:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B672C101A525
	for <linux-audit@redhat.com>; Tue, 28 Apr 2020 22:26:07 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-499-Ywh6CYEmO3WIkk47-IIZWg-1; Tue, 28 Apr 2020 18:26:05 -0400
X-MC-Unique: Ywh6CYEmO3WIkk47-IIZWg-1
Received: by mail-ed1-f66.google.com with SMTP id p16so231475edm.10
	for <linux-audit@redhat.com>; Tue, 28 Apr 2020 15:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o5g+0q4i4NXpQKVni4wkZ3eUg4bn6IsxJhsN8wcx+ak=;
	b=qoinvGcNfGv6DS8RHmiY7LkpHIjdpG2wSgm9KHn+8EVmK5PK0njDyfez0a1XAQB9kJ
	xHQf6aaxUW4Kh0v+hIFKqmWM54qaXG85vfHJsv2RZ1hBVeMIfco37lNi/WDoT5Q2Helq
	h0wJIPM/EljOKsNUJu8dYntRC+uhB68MFHwbDEpit58RLaCJj18ANRDdCLAv6LQDD9RV
	q/YzPrfENre0Qd2Ub09u1o2akswOCRNz26/Wpbxl0bW94S+jE7uCmzUr+gj2tqE+k7dC
	WOeOmgKdC0JBOxMfITIFBC2bWMGUA/hef9WjJJhq8x3KsTMw/JzG5lCtphVDc53tmSTq
	r/5g==
X-Gm-Message-State: AGi0PuZYsSAYOWblzS9CTRLWH2zTkJeIRJd0eyYie+RrXWiQEmhzz+M7
	OCoJIDyu1ptA1PTRG9WZ33WptAlQW7jzL0VYIfvG
X-Google-Smtp-Source: APiQypJdnPD8twnR2I4zFq1PmUsD3icty6Rtrg9MeAig7VH1vYYfF/k1ac08nAwqqrcf6W3VkkknzI+1g9Lre2mmLyY=
X-Received: by 2002:aa7:cd59:: with SMTP id v25mr22787222edw.135.1588112764208;
	Tue, 28 Apr 2020 15:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587500467.git.rgb@redhat.com>
	<b8ba40255978a73ea15e3859d5c945ecd5fede8e.1587500467.git.rgb@redhat.com>
In-Reply-To: <b8ba40255978a73ea15e3859d5c945ecd5fede8e.1587500467.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Apr 2020 18:25:53 -0400
Message-ID: <CAHC9VhR9sNB58A8uQ4FNgAXOgVJ3RaWF4y5MAo=3mcTojaym0Q@mail.gmail.com>
Subject: Re: [PATCH ghak25 v4 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03SMQAjm024639
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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

On Wed, Apr 22, 2020 at 5:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Some table unregister actions seem to be initiated by the kernel to
> garbage collect unused tables that are not initiated by any userspace
> actions.  It was found to be necessary to add the subject credentials to
> cover this case to reveal the source of these actions.  A sample record:
>
>   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)

[I'm going to comment up here instead of in the code because it is a
bit easier for everyone to see what the actual impact might be on the
records.]

Steve wants subject info in this case, okay, but let's try to trim out
some of the fields which simply don't make sense in this record; I'm
thinking of fields that are unset/empty in the kernel case and are
duplicates of other records in the userspace/syscall case.  I think
that means we can drop "tty", "ses", "comm", and "exe" ... yes?

While "auid" is a potential target for removal based on the
dup-or-unset criteria, I think it falls under Steve's request for
subject info here, even if it is garbage in this case.

> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/auditsc.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index d281c18d1771..d7a45b181be0 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -2557,12 +2557,30 @@ void __audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
>                        enum audit_nfcfgop op)
>  {
>         struct audit_buffer *ab;
> +       const struct cred *cred;
> +       struct tty_struct *tty;
> +       char comm[sizeof(current->comm)];
>
>         ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_NETFILTER_CFG);
>         if (!ab)
>                 return;
>         audit_log_format(ab, "table=%s family=%u entries=%u op=%s",
>                          name, af, nentries, audit_nfcfgs[op].s);
> +
> +       cred = current_cred();
> +       tty = audit_get_tty();
> +       audit_log_format(ab, " pid=%u uid=%u auid=%u tty=%s ses=%u",
> +                        task_pid_nr(current),
> +                        from_kuid(&init_user_ns, cred->uid),
> +                        from_kuid(&init_user_ns, audit_get_loginuid(current)),
> +                        tty ? tty_name(tty) : "(none)",
> +                        audit_get_sessionid(current));
> +       audit_put_tty(tty);
> +       audit_log_task_context(ab); /* subj= */
> +       audit_log_format(ab, " comm=");
> +       audit_log_untrustedstring(ab, get_task_comm(comm, current));
> +       audit_log_d_path_exe(ab, current->mm); /* exe= */
> +
>         audit_log_end(ab);
>  }
>  EXPORT_SYMBOL_GPL(__audit_log_nfcfg);

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

