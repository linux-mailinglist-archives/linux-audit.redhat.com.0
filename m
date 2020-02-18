Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 237E6163663
	for <lists+linux-audit@lfdr.de>; Tue, 18 Feb 2020 23:47:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582066068;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yvwqop94h+ndOT/eC7xPeBC5mp9vUmgINm4QbP1QsJk=;
	b=JcQzhJ3e+ZUVeEXHkj5c8YLW415FyTT3HLgwsPH2/zdjFUi1qZl6lojilZf3nrgmzXfS/E
	8LJvlw/q77yQT5PugEBjAjrL4XzHeGLchqQY0OtRgBY1kkSPf4QYj6eJMQt7jOP8HW7dER
	vsG6Y4hgywvV/aFXDw9jOo832q/5Uz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-S8mygr62NUO0GvwhYsTUtQ-1; Tue, 18 Feb 2020 17:47:45 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20B5F801E6D;
	Tue, 18 Feb 2020 22:47:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1E1B1001B05;
	Tue, 18 Feb 2020 22:47:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC0FC18089C8;
	Tue, 18 Feb 2020 22:47:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IMlUMO024327 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 17:47:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B1F1B60C87; Tue, 18 Feb 2020 22:47:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD69460BE1;
	Tue, 18 Feb 2020 22:47:22 +0000 (UTC)
Date: Tue, 18 Feb 2020 17:47:20 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak25 v2 4/9] audit: record nfcfg params
Message-ID: <20200218224720.dwe4ibxxca3mesha@madcap2.tricolour.ca>
References: <cover.1577830902.git.rgb@redhat.com>
	<b1b2e6f917816c4ae85b53d7f93c10c3d1df4a53.1577830902.git.rgb@redhat.com>
	<CAHC9VhRSRggBD9QgXD7-YEx=qY7Ym_1D12y3anAihE=9P7r-6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRSRggBD9QgXD7-YEx=qY7Ym_1D12y3anAihE=9P7r-6w@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: S8mygr62NUO0GvwhYsTUtQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-30 22:18, Paul Moore wrote:
> On Mon, Jan 6, 2020 at 1:55 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > Record the auditable parameters of any non-empty netfilter table
> > configuration change.
> >
> > See: https://github.com/linux-audit/audit-kernel/issues/25
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  include/linux/audit.h | 11 +++++++++++
> >  kernel/auditsc.c      | 16 ++++++++++++++++
> >  2 files changed, 27 insertions(+)
> 
> I can not see a good reason why this patch is separate from patches 5
> and 6, please squash them down into one patch.  As it currently stands
> the logging function introduced here has no caller so it is pointless
> by itself.  Strive to make an individual patch have some significance
> on its own whenever possible.
> 
> This will also help you write a better commit description, right now
> the commit description tells me nothing, but if you bring in the other
> patches you can talk about consolidating similar code into a common
> function.

Fair enough.  I could see squashing some of these, but there are a
number of issues being addressed and would like to see some granularity,
but as you point out, each patch should stand on its own...

> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index f9ceae57ca8d..96cabb095eed 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -379,6 +379,7 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
> >  extern void __audit_fanotify(unsigned int response);
> >  extern void __audit_tk_injoffset(struct timespec64 offset);
> >  extern void __audit_ntp_log(const struct audit_ntp_data *ad);
> > +extern void __audit_nf_cfg(const char *name, u8 af, int nentries);
> >
> >  static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
> >  {
> > @@ -514,6 +515,12 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
> >                 __audit_ntp_log(ad);
> >  }
> >
> > +static inline void audit_nf_cfg(const char *name, u8 af, int nentries)
> > +{
> > +       if (!audit_dummy_context())
> > +               __audit_nf_cfg(name, af, nentries);
> 
> See my comments below about audit_enabled.

I've cleaned up audit_enabled and removed dummy due to ghak120.

> > +}
> > +
> >  extern int audit_n_rules;
> >  extern int audit_signals;
> >  #else /* CONFIG_AUDITSYSCALL */
> > @@ -646,6 +653,10 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
> >
> >  static inline void audit_ptrace(struct task_struct *t)
> >  { }
> > +
> > +static inline void audit_nf_cfg(const char *name, u8 af, int nentries)
> > +{ }
> > +
> >  #define audit_n_rules 0
> >  #define audit_signals 0
> >  #endif /* CONFIG_AUDITSYSCALL */
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 4effe01ebbe2..4e1df4233cd3 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -2545,6 +2545,22 @@ void __audit_ntp_log(const struct audit_ntp_data *ad)
> >         audit_log_ntp_val(ad, "adjust", AUDIT_NTP_ADJUST);
> >  }
> >
> > +void __audit_nf_cfg(const char *name, u8 af, int nentries)
> 
> Should nentries be an unsigned int?

Yes, it should, thank you.

> > +{
> > +       struct audit_buffer *ab;
> > +       struct audit_context *context = audit_context();
> 
> This is a good example of why the context of a caller matters; taken
> alone I would say that we need a check for audit_enabled here, but if
> we look at the latter patches we can see that the caller already has
> the audit_enabled check.
> 
> Considering that the caller is already doing an audit_enabled check,
> we might want to consider moving the audit_enabled check into
> audit_nf_cfg() where we do the dummy context check.  It's a static
> inline so there shouldn't be a performance impact and it makes the
> caller's code cleaner.
> 
> > +       if (!nentries)
> > +               return;
> > +       ab = audit_log_start(context, GFP_KERNEL, AUDIT_NETFILTER_CFG);
> 
> Why do we need the context variable, why not just call audit_context()
> here directly?

Context has been cleaned up.

> > +       if (!ab)
> > +               return; /* audit_panic or being filtered */
> 
> We generally don't add comments when audit_log_start() fails
> elsewhere, please don't do it here.

Ok.

> > +       audit_log_format(ab, "table=%s family=%u entries=%u",
> > +                        name, af, nentries);
> > +       audit_log_end(ab);
> > +}
> > +EXPORT_SYMBOL_GPL(__audit_nf_cfg);
> > +
> >  static void audit_log_task(struct audit_buffer *ab)
> >  {
> >         kuid_t auid, uid;
> > --
> > 1.8.3.1
> 
> --
> paul moore
> www.paul-moore.com
> 

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

