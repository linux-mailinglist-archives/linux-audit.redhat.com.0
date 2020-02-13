Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8B415CD94
	for <lists+linux-audit@lfdr.de>; Thu, 13 Feb 2020 22:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581630616;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gzlhoYRgK6KBtUZu/aOKMgeoJM2jB7tWI65fQRrMCoU=;
	b=bNJ+4m3FfqVoeIWBVfZU0PYs/9sxpc3vW9Pwbj8wXQL/eqYBVJ1Gh84jVp+IJSxQQKXpVA
	D/RWcJKTC237KlaFqXipF4f6jofgbzofDJCHpfw4G5k3thg7ECEOo0nC7CYvxE/SEvl/yx
	rbebswXe1svxnfJnhVaMErgoBThLHQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-8LLWOXr4OoOObaZZyrZdgQ-1; Thu, 13 Feb 2020 16:50:13 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB2641922962;
	Thu, 13 Feb 2020 21:50:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEB135DA85;
	Thu, 13 Feb 2020 21:50:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF6EB81729;
	Thu, 13 Feb 2020 21:50:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DLnwQs006289 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 16:49:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DFDA91007244; Thu, 13 Feb 2020 21:49:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB0021006EC1
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 21:49:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8556867B07
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 21:49:55 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-283-wz2RFaz_MqyOAERm3L2Ugw-1; Thu, 13 Feb 2020 16:49:50 -0500
Received: by mail-ed1-f68.google.com with SMTP id df17so1947650edb.4
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 13:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CIr8PnObM5ymwiwL1EiMYkctE0asXfoeHqvExzLeSc4=;
	b=RVwIe5i0sSBf6w/5GOJajgZ5kxX9EhYbfDJVXN9mKL4vvYsS3pFR2pghN4FXgvLQib
	VG6KWIhn7tkZq931G1yUUYPPIh368tWtN7lS7Ls/RHFP2JodTcqbuJofT+SJ2ITis0m3
	R7XVlniOvsEVm7NJUYcOSE75RUJ7uas08l9QbAFhiZuj8MSE/4YLX2XpmuWd/1HubDHI
	/IFw5n9qi3vxcsgAazXCduMXMP3mh8pOAPjFuvFpcsNZ7VHJG0pJHIhhnw4XTlmDxWZN
	qqJZ5HeKsWsC0q2iW3ZqUjAogVB+7YxRhS9Pby+lSEy+004ASFfoLxMnkzlo0QAd0D7o
	5/MA==
X-Gm-Message-State: APjAAAWrqv4jPIe2JV82OHFxLPxwctdEWAVSDRGV85qb55uS1tEYOImI
	fUoSAwaBShJ5oQV9BcCM/iw6QUK1F7gtmLXe87Cr
X-Google-Smtp-Source: APXvYqzSQm4JJnSM2NwbsgUln1Ol3jVku13aQhiI2KX5XKlMiqINrDBjs9ZRBvvzwBRwGvS0GSsKMYn/KfzBkhIn7o0=
X-Received: by 2002:a17:906:9352:: with SMTP id
	p18mr17616846ejw.95.1581630589598; 
	Thu, 13 Feb 2020 13:49:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<6452955c1e038227a5cd169f689f3fd3db27513f.1577736799.git.rgb@redhat.com>
	<CAHC9VhRkH=YEjAY6dJJHSp934grHnf=O4RiqLu3U8DzdVQOZkg@mail.gmail.com>
	<20200130192753.n7jjrshbhrczjzoe@madcap2.tricolour.ca>
	<CAHC9VhSVN3mNb5enhLR1hY+ekiAyiYWbehrwd_zN7kz13dF=1w@mail.gmail.com>
	<20200205235056.e5365xtgz7rbese2@madcap2.tricolour.ca>
In-Reply-To: <20200205235056.e5365xtgz7rbese2@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 13 Feb 2020 16:49:38 -0500
Message-ID: <CAHC9VhTM6MDHLcBfwJ_9DCroG0VA-meO770ihjn1sVy6=0JrHw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 13/16] audit: track container nesting
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: wz2RFaz_MqyOAERm3L2Ugw-1
X-MC-Unique: 8LLWOXr4OoOObaZZyrZdgQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01DLnwQs006289
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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

On Wed, Feb 5, 2020 at 6:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-02-05 18:05, Paul Moore wrote:
> > On Thu, Jan 30, 2020 at 2:28 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-01-22 16:29, Paul Moore wrote:
> > > > On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > >
> > > > > Track the parent container of a container to be able to filter and
> > > > > report nesting.
> > > > >
> > > > > Now that we have a way to track and check the parent container of a
> > > > > container, modify the contid field format to be able to report that
> > > > > nesting using a carrat ("^") separator to indicate nesting.  The
> > > > > original field format was "contid=<contid>" for task-associated records
> > > > > and "contid=<contid>[,<contid>[...]]" for network-namespace-associated
> > > > > records.  The new field format is
> > > > > "contid=<contid>[^<contid>[...]][,<contid>[...]]".
> > > >
> > > > Let's make sure we always use a comma as a separator, even when
> > > > recording the parent information, for example:
> > > > "contid=<contid>[,^<contid>[...]][,<contid>[...]]"
> > >
> > > The intent here is to clearly indicate and separate nesting from
> > > parallel use of several containers by one netns.  If we do away with
> > > that distinction, then we lose that inheritance accountability and
> > > should really run the list through a "uniq" function to remove the
> > > produced redundancies.  This clear inheritance is something Steve was
> > > looking for since tracking down individual events/records to show that
> > > inheritance was not aways feasible due to rolled logs or search effort.
> >
> > Perhaps my example wasn't clear.  I'm not opposed to the little
> > carat/hat character indicating a container's parent, I just think it
> > would be good to also include a comma *in*addition* to the carat/hat.
>
> Ah, ok.  Well, I'd offer that it would be slightly shorter, slightly
> less cluttered and having already written the parser in userspace, I
> think the parser would be slightly simpler.
>
> I must admit, I was a bit puzzled by your snippet of code that was used
> as a prefix to the next item rather than as a postfix to the given item.
>
> Can you say why you prefer the comma in addition?

Generally speaking, I believe that a single delimiter is both easier
for the eyes to parse, and easier/safer for machines to parse as well.
In this particular case I think of the comma as a delimiter and the
carat as a modifier, reusing the carat as a delimiter seems like a bad
idea to me.

> > > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > > index ef8e07524c46..68be59d1a89b 100644
> > > > > --- a/kernel/audit.c
> > > > > +++ b/kernel/audit.c
> > > >
> > > > > @@ -492,6 +493,7 @@ void audit_switch_task_namespaces(struct nsproxy *ns, struct task_struct *p)
> > > > >                 audit_netns_contid_add(new->net_ns, contid);
> > > > >  }
> > > > >
> > > > > +void audit_log_contid(struct audit_buffer *ab, u64 contid);
> > > >
> > > > If we need a forward declaration, might as well just move it up near
> > > > the top of the file with the rest of the declarations.
> > >
> > > Ok.
> > >
> > > > > +void audit_log_contid(struct audit_buffer *ab, u64 contid)
> > > > > +{
> > > > > +       struct audit_contobj *cont = NULL, *prcont = NULL;
> > > > > +       int h;
> > > >
> > > > It seems safer to pass the audit container ID object and not the u64.
> > >
> > > It would also be faster, but in some places it isn't available such as
> > > for ptrace and signal targets.  This also links back to the drop record
> > > refcounts to hold onto the contobj until process exit, or signal
> > > delivery.
> > >
> > > What we could do is to supply two potential parameters, a contobj and/or
> > > a contid, and have it use the contobj if it is valid, otherwise, use the
> > > contid, as is done for names and paths supplied to audit_log_name().
> >
> > Let's not do multiple parameters, that begs for misuse, let's take the
> > wrapper function route:
> >
> >  func a(int id) {
> >    // important stuff
> >  }
> >
> >  func ao(struct obj) {
> >    a(obj.id);
> >  }
> >
> > ... and we can add a comment that you *really* should be using the
> > variant that passes an object.
>
> I was already doing that where it available, and dereferencing the id
> for the call.  But I see an advantage to having both parameters supplied
> to the function, since it saves us the trouble of dereferencing it,
> searching for the id in the hash list and re-locating the object if the
> object is already available.

I strongly prefer we not do multiple parameters for the same "thing";
I would much rather do the wrapper approach as described above.  I
would also like to see us use the audit container ID object as much as
possible, using a bare integer should be a last resort.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

