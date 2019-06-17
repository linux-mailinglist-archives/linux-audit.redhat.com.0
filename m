Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF85494FD
	for <lists+linux-audit@lfdr.de>; Tue, 18 Jun 2019 00:16:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 397A9C05167B;
	Mon, 17 Jun 2019 22:16:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14C8654586;
	Mon, 17 Jun 2019 22:16:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C98E3F6E4;
	Mon, 17 Jun 2019 22:16:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HMFkag007937 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 18:15:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33AC78199; Mon, 17 Jun 2019 22:15:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EAB258A9
	for <linux-audit@redhat.com>; Mon, 17 Jun 2019 22:15:42 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72CB2309B159
	for <linux-audit@redhat.com>; Mon, 17 Jun 2019 22:15:32 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id b11so7725832lfa.5
	for <linux-audit@redhat.com>; Mon, 17 Jun 2019 15:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c5UIf+bhX+TscweExnBplZZa2iUS4eVkN91TUCyDIjc=;
	b=t+fWdAO+kDytO6Qe2BvENv40nSMghSAZkq/QjTqjeur22v/BBMKMR2T2iwMdgFuCK/
	wL4fe2VCXZMM9bnyZ6OGwplg3xS0ff5gcj3IsH/BpmxTyAJIlE4GVMGvFgeBH0WC6h8B
	4kIv18eoGH+jcMa2iKr08PaRi3yYeLj32DUAdKpPzKLrHKPpTdX9F30IORcnvkGkmHnq
	CTb3nYcsO3Rja53nkvmFYBBsi67iNt1EapUWX5nVD7RPNrV6p/7IFNz3cP1v4DoICSSg
	tAtsAqm78XQx9N/+QnXmtpeDQwOMmd9jJulg0P5RVzzXQFu7wHyys0WZ5jhwSga67MW4
	L8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c5UIf+bhX+TscweExnBplZZa2iUS4eVkN91TUCyDIjc=;
	b=aqirrthvyWXMl1/zESgrw1wKfsEbYievjtJBGwaAo7G3QKlpundomQixJ8hL/jVi5t
	QKNJMuzu/3EF1ykuUET3bPhYLSjYjdtQaWDnNwoNpfW1UP7+lro8gmeLTUY+cu2rFF55
	nqVVhvF2LJnIk6d9LMQUEcm5QluyVxIo2q+9Q3N1BjtmsGVSaL92709EkG/rbg/fXhme
	JErHJW+Fn/yH2JedukfnQRI2Sm/UFn2J969Ep+eyIBfRbR4LEK7b4GarGesZtXNbm/uP
	6mTyPfJAhg4ekileDhWrLkXr1Q5mv5TNy3qspd8OL3KCpXipUBn/ewP++WI0VonIyTkF
	bkgA==
X-Gm-Message-State: APjAAAUNmal43CoMcJQwWAr8a3C4/EAFjYHhGh9EUvbNo2hkP4IlHB0L
	AMeqZhI2P8dyjywbiWUwcsAyW40VUEt71L3btc4Bznh6Vg==
X-Google-Smtp-Source: APXvYqzJk1+r3WEYAvcSc4G69gUJrY/Lj0o95tRZ6iNfY9UKCSo0STH+khxu8QVrnuz2PewmDfXmvQA2r6UC6596xrU=
X-Received: by 2002:ac2:410a:: with SMTP id b10mr6357850lfi.175.1560809730743; 
	Mon, 17 Jun 2019 15:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <53af233d05da5e07d75d122878387288a10276df.1560447640.git.rgb@redhat.com>
	<CAFqZXNvTAj_MhgbUB0kbQwF+gDQTTO5jXPagQfW9qwfHEzc1iQ@mail.gmail.com>
In-Reply-To: <CAFqZXNvTAj_MhgbUB0kbQwF+gDQTTO5jXPagQfW9qwfHEzc1iQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 17 Jun 2019 18:15:19 -0400
Message-ID: <CAHC9VhRnwnzPikvBg1GaJU30zhj009zN7N8HmM_kt6v8o+8HBg@mail.gmail.com>
Subject: Re: [PATCH ghak57 V1] selinux: format all invalid context as untrusted
To: Ondrej Mosnacek <omosnace@redhat.com>, Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 17 Jun 2019 22:15:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Mon, 17 Jun 2019 22:15:32 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: SElinux list <selinux@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Mon, 17 Jun 2019 22:16:42 +0000 (UTC)

On Fri, Jun 14, 2019 at 4:05 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> On Thu, Jun 13, 2019 at 8:43 PM Richard Guy Briggs <rgb@redhat.com> wrote:

...

> > diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
> > index cc043bc8fd4c..817576802f7d 100644
> > --- a/security/selinux/ss/services.c
> > +++ b/security/selinux/ss/services.c
> > @@ -1588,6 +1588,8 @@ static int compute_sid_handle_invalid_context(
> >         struct policydb *policydb = &state->ss->policydb;
> >         char *s = NULL, *t = NULL, *n = NULL;
> >         u32 slen, tlen, nlen;
> > +       struct audit_buffer *ab;
> > +       size_t audit_size;
> >
> >         if (context_struct_to_string(policydb, scontext, &s, &slen))
> >                 goto out;
> > @@ -1595,12 +1597,22 @@ static int compute_sid_handle_invalid_context(
> >                 goto out;
> >         if (context_struct_to_string(policydb, newcontext, &n, &nlen))
> >                 goto out;
> > -       audit_log(audit_context(), GFP_ATOMIC, AUDIT_SELINUX_ERR,
> > -                 "op=security_compute_sid invalid_context=%s"
> > -                 " scontext=%s"
> > -                 " tcontext=%s"
> > -                 " tclass=%s",
> > -                 n, s, t, sym_name(policydb, SYM_CLASSES, tclass-1));
> > +       /* We strip a nul only if it is at the end, otherwise the
> > +        * context contains a nul and we should audit that */
> > +       if (n) {
> > +               if (n[nlen - 1] == '\0')
> > +                       audit_size = nlen - 1;
> > +               else
> > +                       audit_size = nlen;
> > +       } else {
> > +               audit_size = 0;
> > +       }
>
> If you reasonably assume that (n == NULL) implies (nlen == 0), then
> you can simplify this down to:
>
>     audit_size = nlen;
>     if (nlen && n[nlen - 1] == '\0')
>         audit_size--;
>
> (or similar), see my recent patch to log *rawcon as untrusted [2].
> That is IMHO faster to parse. But I see you copied it from
> selinux_inode_setxattr(), where it is like this...

You could likely simplify this even further by getting rid of
audit_size and just using nlen; there is no reason why we need to
preserve the original nlen value in this function.  Also, keep in mind
that if you are hitting that chunk of code, and not jumping to "out"
due to a context_struct_to_string() error, then you should have a
properly formatted SELinux label, it just happens to be invalid for
the currently loaded policy.  Something like the following should be
safe:

  if (n[nlen - 1] == '\0')
    nlen--;
  audit_log_start(...);
  audit_log_format("... invalid_context=");
  audit_log_n_untrustedstring(n, nlen);
  audit_log_format(...);
  audit_log_end(...);

Also, to be honest, the string you get back from
context_struct_to_string() is always going to be NUL-terminated so you
could simplify this further:

  audit_log_start(...);
  audit_log_format("... invalid_context=");
  /* no need to record the NUL with untrusted strings */
  audit_log_n_untrustedstring(n, nlen - 1);
  audit_log_format(...);
  audit_log_end(...);

> I'm not sure if it
> is worth changing this patch / consolidating the style across all
> places that do this / creating a helper function...

If anyone is going to look into that, it should be done in a separate patch.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
