Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 01560219437
	for <lists+linux-audit@lfdr.de>; Thu,  9 Jul 2020 01:18:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594250298;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uqotxKLSyKvZgQuknq2mB6rZYDV9psue3BCiKPi0Biw=;
	b=Zl9ozcJq1gc92iDqsPfsp7enGj3lu7S9xKsjmGzAYBOOdKHWYoVc2xVHGemlBMKUprNHPA
	w8Y1sPMRSldYrbvVuYyD0cNYfhWqKwRzulkgaI5fdre6M+J3Hn6CwqLflp8PHxNKU/Qedv
	OzIGPA1OulsqVyY1qZ9o+yxSGgyTHSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-_urjHg-5OPiboVoP9qMTOA-1; Wed, 08 Jul 2020 19:18:15 -0400
X-MC-Unique: _urjHg-5OPiboVoP9qMTOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F94F802782;
	Wed,  8 Jul 2020 23:18:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D544A77F54;
	Wed,  8 Jul 2020 23:18:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 984501CA6;
	Wed,  8 Jul 2020 23:18:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068NF29x021842 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 19:15:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D58B2B6F0; Wed,  8 Jul 2020 23:15:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BB9A19C4F;
	Wed,  8 Jul 2020 23:14:54 +0000 (UTC)
Date: Wed, 8 Jul 2020 19:14:51 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak84 v3] audit: purge audit_log_string from the
	intra-kernel audit API
Message-ID: <20200708231451.7t7cadrqhrp357is@madcap2.tricolour.ca>
References: <20597345545df186f0a287c974c9dc88b5c940a0.1593808662.git.rgb@redhat.com>
	<CAHC9VhQT2O9GnVBhXvzpP+yNNoCqy-XTfMC7OHqz3xvFVaGvdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQT2O9GnVBhXvzpP+yNNoCqy-XTfMC7OHqz3xvFVaGvdw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-08 18:41, Paul Moore wrote:
> On Fri, Jul 3, 2020 at 5:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > audit_log_string() was inteded to be an internal audit function and
> > since there are only two internal uses, remove them.  Purge all external
> > uses of it by restructuring code to use an existing audit_log_format()
> > or using audit_log_format().
> >
> > Please see the upstream issue
> > https://github.com/linux-audit/audit-kernel/issues/84
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> > Passes audit-testsuite.
> >
> > Changelog:
> > v3
> > - fix two warning: non-void function does not return a value in all control paths
> >         Reported-by: kernel test robot <lkp@intel.com>
> >
> > v2
> > - restructure to piggyback on existing audit_log_format() calls, checking quoting needs for each.
> >
> > v1 Vlad Dronov
> > - https://github.com/nefigtut/audit-kernel/commit/dbbcba46335a002f44b05874153a85b9cc18aebf
> >
> >  include/linux/audit.h     |  5 -----
> >  kernel/audit.c            |  4 ++--
> >  security/apparmor/audit.c | 10 ++++------
> >  security/apparmor/file.c  | 25 +++++++------------------
> >  security/apparmor/ipc.c   | 46 +++++++++++++++++++++++-----------------------
> >  security/apparmor/net.c   | 14 ++++++++------
> >  security/lsm_audit.c      |  4 ++--
> >  7 files changed, 46 insertions(+), 62 deletions(-)
> 
> ...
> 
> > diff --git a/security/apparmor/audit.c b/security/apparmor/audit.c
> > index 597732503815..335b5b8d300b 100644
> > --- a/security/apparmor/audit.c
> > +++ b/security/apparmor/audit.c
> > @@ -57,18 +57,16 @@ static void audit_pre(struct audit_buffer *ab, void *ca)
> >         struct common_audit_data *sa = ca;
> >
> >         if (aa_g_audit_header) {
> > -               audit_log_format(ab, "apparmor=");
> > -               audit_log_string(ab, aa_audit_type[aad(sa)->type]);
> > +               audit_log_format(ab, "apparmor=%s",
> > +                                aa_audit_type[aad(sa)->type]);
> >         }
> >
> >         if (aad(sa)->op) {
> > -               audit_log_format(ab, " operation=");
> > -               audit_log_string(ab, aad(sa)->op);
> > +               audit_log_format(ab, " operation=%s", aad(sa)->op);
> >         }
> 
> In the case below you've added the quotes around the string, but they
> appear to be missing in the two cases above.

They aren't needed above since they are text with no spaces or special
characters.  We don't usually include double quotes where they aren't
needed.  The one below contains spaces so needs double quotes.

> >         if (aad(sa)->info) {
> > -               audit_log_format(ab, " info=");
> > -               audit_log_string(ab, aad(sa)->info);
> > +               audit_log_format(ab, " info=\"%s\"", aad(sa)->info);
> >                 if (aad(sa)->error)
> >                         audit_log_format(ab, " error=%d", aad(sa)->error);
> >         }
> > diff --git a/security/apparmor/file.c b/security/apparmor/file.c
> > index 9a2d14b7c9f8..70f27124d051 100644
> > --- a/security/apparmor/file.c
> > +++ b/security/apparmor/file.c
> > @@ -35,20 +35,6 @@ static u32 map_mask_to_chr_mask(u32 mask)
> >  }
> >
> >  /**
> > - * audit_file_mask - convert mask to permission string
> > - * @buffer: buffer to write string to (NOT NULL)
> > - * @mask: permission mask to convert
> > - */
> > -static void audit_file_mask(struct audit_buffer *ab, u32 mask)
> > -{
> > -       char str[10];
> > -
> > -       aa_perm_mask_to_str(str, sizeof(str), aa_file_perm_chrs,
> > -                           map_mask_to_chr_mask(mask));
> > -       audit_log_string(ab, str);
> > -}
> > -
> > -/**
> >   * file_audit_cb - call back for file specific audit fields
> >   * @ab: audit_buffer  (NOT NULL)
> >   * @va: audit struct to audit values of  (NOT NULL)
> > @@ -57,14 +43,17 @@ static void file_audit_cb(struct audit_buffer *ab, void *va)
> >  {
> >         struct common_audit_data *sa = va;
> >         kuid_t fsuid = current_fsuid();
> > +       char str[10];
> >
> >         if (aad(sa)->request & AA_AUDIT_FILE_MASK) {
> > -               audit_log_format(ab, " requested_mask=");
> > -               audit_file_mask(ab, aad(sa)->request);
> > +               aa_perm_mask_to_str(str, sizeof(str), aa_file_perm_chrs,
> > +                                   map_mask_to_chr_mask(aad(sa)->request));
> > +               audit_log_format(ab, " requested_mask=%s", str);
> >         }
> >         if (aad(sa)->denied & AA_AUDIT_FILE_MASK) {
> > -               audit_log_format(ab, " denied_mask=");
> > -               audit_file_mask(ab, aad(sa)->denied);
> > +               aa_perm_mask_to_str(str, sizeof(str), aa_file_perm_chrs,
> > +                                   map_mask_to_chr_mask(aad(sa)->denied));
> > +               audit_log_format(ab, " denied_mask=%s", str);
> >         }
> 
> More missing quotes.

This is a simple text field without punctuation or special characters.

> >         if (aad(sa)->request & AA_AUDIT_FILE_MASK) {
> >                 audit_log_format(ab, " fsuid=%d",
> > diff --git a/security/apparmor/ipc.c b/security/apparmor/ipc.c
> > index 4ecedffbdd33..fe431731883f 100644
> > --- a/security/apparmor/ipc.c
> > +++ b/security/apparmor/ipc.c
> > @@ -20,25 +20,23 @@
> >
> >  /**
> >   * audit_ptrace_mask - convert mask to permission string
> > - * @buffer: buffer to write string to (NOT NULL)
> >   * @mask: permission mask to convert
> > + *
> > + * Returns: pointer to static string
> >   */
> > -static void audit_ptrace_mask(struct audit_buffer *ab, u32 mask)
> > +static const char *audit_ptrace_mask(u32 mask)
> >  {
> >         switch (mask) {
> >         case MAY_READ:
> > -               audit_log_string(ab, "read");
> > -               break;
> > +               return "read";
> >         case MAY_WRITE:
> > -               audit_log_string(ab, "trace");
> > -               break;
> > +               return "trace";
> >         case AA_MAY_BE_READ:
> > -               audit_log_string(ab, "readby");
> > -               break;
> > +               return "readby";
> >         case AA_MAY_BE_TRACED:
> > -               audit_log_string(ab, "tracedby");
> > -               break;
> > +               return "tracedby";
> >         }
> > +       return "";
> >  }
> >
> >  /* call back to audit ptrace fields */
> > @@ -47,12 +45,12 @@ static void audit_ptrace_cb(struct audit_buffer *ab, void *va)
> >         struct common_audit_data *sa = va;
> >
> >         if (aad(sa)->request & AA_PTRACE_PERM_MASK) {
> > -               audit_log_format(ab, " requested_mask=");
> > -               audit_ptrace_mask(ab, aad(sa)->request);
> > +               audit_log_format(ab, " requested_mask=%s",
> > +                                audit_ptrace_mask(aad(sa)->request));
> >
> >                 if (aad(sa)->denied & AA_PTRACE_PERM_MASK) {
> > -                       audit_log_format(ab, " denied_mask=");
> > -                       audit_ptrace_mask(ab, aad(sa)->denied);
> > +                       audit_log_format(ab, " denied_mask=%s",
> > +                                        audit_ptrace_mask(aad(sa)->denied));
> >                 }
> 
> Quotes.  There are none.
> 
> ... and it looks like there are more missing too, but I kinda stopped
> seriously reading the patch here, please take a closer look at the
> patch, make the necessary changes, and resubmit.

This was all intentional as per the previous patch review discussion on github.

> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

