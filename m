Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E4E0F2194DB
	for <lists+linux-audit@lfdr.de>; Thu,  9 Jul 2020 02:09:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-0W99RXQFOQy8KCxTW8b0Cw-1; Wed, 08 Jul 2020 20:09:26 -0400
X-MC-Unique: 0W99RXQFOQy8KCxTW8b0Cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B8B6800FF1;
	Thu,  9 Jul 2020 00:09:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 458FC79231;
	Thu,  9 Jul 2020 00:09:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9980B1809547;
	Thu,  9 Jul 2020 00:09:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069092Ub029700 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 20:09:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B476A202B16E; Thu,  9 Jul 2020 00:09:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ECB42026D69
	for <linux-audit@redhat.com>; Thu,  9 Jul 2020 00:08:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87FC0100CF84
	for <linux-audit@redhat.com>; Thu,  9 Jul 2020 00:08:59 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-425-93inQPbmNSeauoFNoRNNoQ-1; Wed, 08 Jul 2020 20:08:57 -0400
X-MC-Unique: 93inQPbmNSeauoFNoRNNoQ-1
Received: by mail-ej1-f66.google.com with SMTP id lx13so338516ejb.4
	for <linux-audit@redhat.com>; Wed, 08 Jul 2020 17:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dfSIS5yk5jLXU+XWrQiybY07dTfJj+JoTKxtfXVEKnA=;
	b=J4C6GOatvNyeMmoQSFZrXyjwsqcoK/U1qBxb1qi/dzj7PTc2EG7eibUginuFfGn7CE
	5mWJtjO6O8VGSVCldVYBnJNPCbqd7B2Pdzgu/8vCLCMKCDlEKGNVdCFgTGVXrZnkVXwb
	c2EUNQtNcvTbCYK2Ik1Chk3kp6uK+UUgM37Bc8zuHBlDJB/VXsLq7jYSFteUP6cxC2DB
	zjo5cgFV7Noq93NMn/FfpxdX46WIVj08HxlfO+ycn0NCDpyb3zGFWpzTBiFiCT997nMP
	LVBlD6zkpwtjDUTRZ/bizAcmDyKMuNu7vZ7pZJ3CeojRkxZZmQWB2l9cjSAEJERFtgeS
	YDBQ==
X-Gm-Message-State: AOAM530p1RRVhEPIkdiy8RaKDujTjkCbB5Pk6NoxHYFoDV8NJvOV96Ni
	GAUKitPti7mG1IdWrlH1hrVOJsfjA3TKUUMTuwDK
X-Google-Smtp-Source: ABdhPJz5e1n3SnQVVu29n0LX+xXPlz0iBoYvj8aOVOWwAZ7OX9oQu7+C2I3cfw+OBU1n34vjP7/tkEaCFaMZY0woZlg=
X-Received: by 2002:a17:906:1403:: with SMTP id
	p3mr45168574ejc.106.1594253335185; 
	Wed, 08 Jul 2020 17:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20597345545df186f0a287c974c9dc88b5c940a0.1593808662.git.rgb@redhat.com>
	<CAHC9VhQT2O9GnVBhXvzpP+yNNoCqy-XTfMC7OHqz3xvFVaGvdw@mail.gmail.com>
	<20200708231451.7t7cadrqhrp357is@madcap2.tricolour.ca>
In-Reply-To: <20200708231451.7t7cadrqhrp357is@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Jul 2020 20:08:44 -0400
Message-ID: <CAHC9VhST+tozA2SKNnzS6ZMWQe8C_n+WG+7vH_BvET9NutDuOw@mail.gmail.com>
Subject: Re: [PATCH ghak84 v3] audit: purge audit_log_string from the
	intra-kernel audit API
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, john.johansen@canonical.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 8, 2020 at 7:15 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-08 18:41, Paul Moore wrote:
> > On Fri, Jul 3, 2020 at 5:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > audit_log_string() was inteded to be an internal audit function and
> > > since there are only two internal uses, remove them.  Purge all external
> > > uses of it by restructuring code to use an existing audit_log_format()
> > > or using audit_log_format().
> > >
> > > Please see the upstream issue
> > > https://github.com/linux-audit/audit-kernel/issues/84
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > > Passes audit-testsuite.
> > >
> > > Changelog:
> > > v3
> > > - fix two warning: non-void function does not return a value in all control paths
> > >         Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > v2
> > > - restructure to piggyback on existing audit_log_format() calls, checking quoting needs for each.
> > >
> > > v1 Vlad Dronov
> > > - https://github.com/nefigtut/audit-kernel/commit/dbbcba46335a002f44b05874153a85b9cc18aebf
> > >
> > >  include/linux/audit.h     |  5 -----
> > >  kernel/audit.c            |  4 ++--
> > >  security/apparmor/audit.c | 10 ++++------
> > >  security/apparmor/file.c  | 25 +++++++------------------
> > >  security/apparmor/ipc.c   | 46 +++++++++++++++++++++++-----------------------
> > >  security/apparmor/net.c   | 14 ++++++++------
> > >  security/lsm_audit.c      |  4 ++--
> > >  7 files changed, 46 insertions(+), 62 deletions(-)
> >
> > ...
> >
> > > diff --git a/security/apparmor/audit.c b/security/apparmor/audit.c
> > > index 597732503815..335b5b8d300b 100644
> > > --- a/security/apparmor/audit.c
> > > +++ b/security/apparmor/audit.c
> > > @@ -57,18 +57,16 @@ static void audit_pre(struct audit_buffer *ab, void *ca)
> > >         struct common_audit_data *sa = ca;
> > >
> > >         if (aa_g_audit_header) {
> > > -               audit_log_format(ab, "apparmor=");
> > > -               audit_log_string(ab, aa_audit_type[aad(sa)->type]);
> > > +               audit_log_format(ab, "apparmor=%s",
> > > +                                aa_audit_type[aad(sa)->type]);
> > >         }
> > >
> > >         if (aad(sa)->op) {
> > > -               audit_log_format(ab, " operation=");
> > > -               audit_log_string(ab, aad(sa)->op);
> > > +               audit_log_format(ab, " operation=%s", aad(sa)->op);
> > >         }
> >
> > In the case below you've added the quotes around the string, but they
> > appear to be missing in the two cases above.
>
> They aren't needed above since they are text with no spaces or special
> characters.  We don't usually include double quotes where they aren't
> needed.  The one below contains spaces so needs double quotes.
>
> > >         if (aad(sa)->info) {
> > > -               audit_log_format(ab, " info=");
> > > -               audit_log_string(ab, aad(sa)->info);
> > > +               audit_log_format(ab, " info=\"%s\"", aad(sa)->info);
> > >                 if (aad(sa)->error)
> > >                         audit_log_format(ab, " error=%d", aad(sa)->error);
> > >         }
> > > diff --git a/security/apparmor/file.c b/security/apparmor/file.c
> > > index 9a2d14b7c9f8..70f27124d051 100644
> > > --- a/security/apparmor/file.c
> > > +++ b/security/apparmor/file.c
> > > @@ -35,20 +35,6 @@ static u32 map_mask_to_chr_mask(u32 mask)
> > >  }
> > >
> > >  /**
> > > - * audit_file_mask - convert mask to permission string
> > > - * @buffer: buffer to write string to (NOT NULL)
> > > - * @mask: permission mask to convert
> > > - */
> > > -static void audit_file_mask(struct audit_buffer *ab, u32 mask)
> > > -{
> > > -       char str[10];
> > > -
> > > -       aa_perm_mask_to_str(str, sizeof(str), aa_file_perm_chrs,
> > > -                           map_mask_to_chr_mask(mask));
> > > -       audit_log_string(ab, str);
> > > -}
> > > -
> > > -/**
> > >   * file_audit_cb - call back for file specific audit fields
> > >   * @ab: audit_buffer  (NOT NULL)
> > >   * @va: audit struct to audit values of  (NOT NULL)
> > > @@ -57,14 +43,17 @@ static void file_audit_cb(struct audit_buffer *ab, void *va)
> > >  {
> > >         struct common_audit_data *sa = va;
> > >         kuid_t fsuid = current_fsuid();
> > > +       char str[10];
> > >
> > >         if (aad(sa)->request & AA_AUDIT_FILE_MASK) {
> > > -               audit_log_format(ab, " requested_mask=");
> > > -               audit_file_mask(ab, aad(sa)->request);
> > > +               aa_perm_mask_to_str(str, sizeof(str), aa_file_perm_chrs,
> > > +                                   map_mask_to_chr_mask(aad(sa)->request));
> > > +               audit_log_format(ab, " requested_mask=%s", str);
> > >         }
> > >         if (aad(sa)->denied & AA_AUDIT_FILE_MASK) {
> > > -               audit_log_format(ab, " denied_mask=");
> > > -               audit_file_mask(ab, aad(sa)->denied);
> > > +               aa_perm_mask_to_str(str, sizeof(str), aa_file_perm_chrs,
> > > +                                   map_mask_to_chr_mask(aad(sa)->denied));
> > > +               audit_log_format(ab, " denied_mask=%s", str);
> > >         }
> >
> > More missing quotes.
>
> This is a simple text field without punctuation or special characters.
>
> > >         if (aad(sa)->request & AA_AUDIT_FILE_MASK) {
> > >                 audit_log_format(ab, " fsuid=%d",
> > > diff --git a/security/apparmor/ipc.c b/security/apparmor/ipc.c
> > > index 4ecedffbdd33..fe431731883f 100644
> > > --- a/security/apparmor/ipc.c
> > > +++ b/security/apparmor/ipc.c
> > > @@ -20,25 +20,23 @@
> > >
> > >  /**
> > >   * audit_ptrace_mask - convert mask to permission string
> > > - * @buffer: buffer to write string to (NOT NULL)
> > >   * @mask: permission mask to convert
> > > + *
> > > + * Returns: pointer to static string
> > >   */
> > > -static void audit_ptrace_mask(struct audit_buffer *ab, u32 mask)
> > > +static const char *audit_ptrace_mask(u32 mask)
> > >  {
> > >         switch (mask) {
> > >         case MAY_READ:
> > > -               audit_log_string(ab, "read");
> > > -               break;
> > > +               return "read";
> > >         case MAY_WRITE:
> > > -               audit_log_string(ab, "trace");
> > > -               break;
> > > +               return "trace";
> > >         case AA_MAY_BE_READ:
> > > -               audit_log_string(ab, "readby");
> > > -               break;
> > > +               return "readby";
> > >         case AA_MAY_BE_TRACED:
> > > -               audit_log_string(ab, "tracedby");
> > > -               break;
> > > +               return "tracedby";
> > >         }
> > > +       return "";
> > >  }
> > >
> > >  /* call back to audit ptrace fields */
> > > @@ -47,12 +45,12 @@ static void audit_ptrace_cb(struct audit_buffer *ab, void *va)
> > >         struct common_audit_data *sa = va;
> > >
> > >         if (aad(sa)->request & AA_PTRACE_PERM_MASK) {
> > > -               audit_log_format(ab, " requested_mask=");
> > > -               audit_ptrace_mask(ab, aad(sa)->request);
> > > +               audit_log_format(ab, " requested_mask=%s",
> > > +                                audit_ptrace_mask(aad(sa)->request));
> > >
> > >                 if (aad(sa)->denied & AA_PTRACE_PERM_MASK) {
> > > -                       audit_log_format(ab, " denied_mask=");
> > > -                       audit_ptrace_mask(ab, aad(sa)->denied);
> > > +                       audit_log_format(ab, " denied_mask=%s",
> > > +                                        audit_ptrace_mask(aad(sa)->denied));
> > >                 }
> >
> > Quotes.  There are none.
> >
> > ... and it looks like there are more missing too, but I kinda stopped
> > seriously reading the patch here, please take a closer look at the
> > patch, make the necessary changes, and resubmit.
>
> This was all intentional as per the previous patch review discussion on github.

The GitHub discussion doesn't explicitly address the issue of quoting,
and it's on GitHub not in the commit description.  Links, while
helpful, do not count; the commit descriptions must stand on their
own.

I generally frown upon patches which change the record formatting,
this patch is no exception.  Please revise the patch so there is no
change and in the records emitted from the kernel and resubmit.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

