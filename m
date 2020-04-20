Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 757971B1A59
	for <lists+linux-audit@lfdr.de>; Tue, 21 Apr 2020 01:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587427016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WMg7KIlXoVonuJALlPqwMIwOMJ2wtP+8v7F62e9EqV4=;
	b=f2AC2pux4DsatNBxboierEU3KsdZK3Np9eU25IX2q57IQh7nDGHDfDuwg+XwpdKGY3diBR
	nmV32+Twx4lRMDzlRPNfli/EVmUSrKazolToy/OMRto8hGlAqXxSb7neg8e5qxNhIbCvTe
	DzSRPP4FV9dpwX1N1IglVcfsWN0T/gQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-QENLoDGfMJKy_ZRDAjTfxw-1; Mon, 20 Apr 2020 19:56:53 -0400
X-MC-Unique: QENLoDGfMJKy_ZRDAjTfxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13A1B1034B20;
	Mon, 20 Apr 2020 23:56:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F404A188F;
	Mon, 20 Apr 2020 23:56:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86A7D18095FF;
	Mon, 20 Apr 2020 23:56:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KNubT7005483 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 19:56:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E5B917881; Mon, 20 Apr 2020 23:56:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89D53DBF02
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 23:56:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 396D8101A55A
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 23:56:35 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-241-7wS8X0VgO724D0Vq0ZYjlQ-1; Mon, 20 Apr 2020 19:56:31 -0400
X-MC-Unique: 7wS8X0VgO724D0Vq0ZYjlQ-1
Received: by mail-il1-f195.google.com with SMTP id b18so11794778ilf.2
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 16:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=dhZDelkJ1pgSB9luhuj4AUCg6Nc/ioLuNZM+8zLdzPg=;
	b=JLoTHWoCbWfd5dHvsQv5uXf/YA1MxZsfWjFrrqgN9w3uf4oUz+uPi9KoPMQR36ADfl
	aL3XCBH5Lebq/1ZvgL3q+D9WNhhWRVhkTwNTBGT/UnYEAtTnGAyX1Sc4U0F0xhjkFk49
	RWOY0IZH6HzN76qgRSZ3Qk10B8GZbzQcg1w/boVUm5htigYTigcMBuntPOUnP2yBAKlD
	zH/AaqSUISOLYB1Pwid7FomasDrDp2qGbslD95ppRM8OzwL50jAzNTrCh141P5meU63t
	g2zG5OIkJvQIdSzZsmb1gj7Gx9YSZ3wxBhunu0QOI6eJmQ6I4X8PuAAAjReayH3umqVm
	COKg==
X-Gm-Message-State: AGi0PuZ/hgprHGpNa5hXRJ53n9Y/35oAdwzQgUYe/D4CEJ2NhjFaFYge
	dt1Ek7yI4JcI1qROINOrqfkQomVhKlk=
X-Google-Smtp-Source: APiQypI4XYtBBvt/7KD20RvSmIJwowNva6X+Udfk/bM5fvmlPesSSG8/0zOSFMhEFFgPcb3kwMrCQA==
X-Received: by 2002:a92:9a8a:: with SMTP id c10mr17927730ill.187.1587426990948;
	Mon, 20 Apr 2020 16:56:30 -0700 (PDT)
Received: from [192.168.0.137] ([216.158.248.173])
	by smtp.gmail.com with ESMTPSA id h82sm383800ila.14.2020.04.20.16.56.30
	for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Apr 2020 16:56:30 -0700 (PDT)
Subject: Re: [PATCH] audit: check the length of userspace generated audit
	records
To: linux-audit@redhat.com
References: <158741856073.246860.5955712228915579.stgit@chester>
	<20200420215615.chh4c5ytxumadtt7@madcap2.tricolour.ca>
	<CAHC9VhSypHKGHeVVLF+fVEFkVmDCP0uCZ0s1FXRPzvnsr73sZQ@mail.gmail.com>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <728a2bfa-a5f2-4178-49f1-405adef62ee4@magitekltd.com>
Date: Mon, 20 Apr 2020 17:56:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSypHKGHeVVLF+fVEFkVmDCP0uCZ0s1FXRPzvnsr73sZQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Content-Type: multipart/mixed; boundary="===============9136615526811011628=="

This is a multi-part message in MIME format.
--===============9136615526811011628==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="------------C6E58AF2CE9CAC9253CECB6A"

This is a multi-part message in MIME format.
--------------C6E58AF2CE9CAC9253CECB6A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/20/20 5:29 PM, Paul Moore wrote:

> On Mon, Apr 20, 2020 at 5:56 PM Richard Guy Briggs<rgb@redhat.com>  wrote=
:
>> On 2020-04-20 17:36, Paul Moore wrote:
>>> Commit 756125289285 ("audit: always check the netlink payload length
>>> in audit_receive_msg()") fixed a number of missing message length
>>> checks, but forgot to check the length of userspace generated audit
>>> records.  The good news is that you need CAP_AUDIT_WRITE to submit
>>> userspace audit records, which is generally only given to trusted
>>> processes, so the impact should be limited.
>>>
>>> Cc:stable@vger.kernel.org
>>> Fixes: 756125289285 ("audit: always check the netlink payload length in=
 audit_receive_msg()")
>>> Reported-by:syzbot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com
>>> Signed-off-by: Paul Moore<paul@paul-moore.com>
>>> ---
>>>   kernel/audit.c |    3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/kernel/audit.c b/kernel/audit.c
>>> index b69c8b460341..87f31bf1f0a0 100644
>>> --- a/kernel/audit.c
>>> +++ b/kernel/audit.c
>>> @@ -1326,6 +1326,9 @@ static int audit_receive_msg(struct sk_buff *skb,=
 struct nlmsghdr *nlh)
>>>        case AUDIT_FIRST_USER_MSG2 ... AUDIT_LAST_USER_MSG2:
>>>                if (!audit_enabled && msg_type !=3D AUDIT_USER_AVC)
>>>                        return 0;
>>> +             /* exit early if there isn't at least one character to pr=
int */
>>> +             if (data_len < 2)
>>> +                     return -EINVAL;
>> Don't we want to issue the record even if the message is empty?  If a
>> len of 1 is passed in, it will properly set str[0] =3D '\0' and str poin=
ts
>> to a location with a null that prints nothing between the single quotes
>> of "msg=3D''".  So, I think that should be "if (data_len < 1)".
>>
>> Am I missing something?
> I've got no problem with allowing an empty message so long as there is
> a valid use for such a message.  Can anyone think of a valid reason
> for having an empty userspace generated record?

Not really. Using the libaudit interface(s), even if an empty message=20
string is sent, and handled in the lib call(s), I believe it will have=20
minimum contextual info, e.g. "exe=3D... hostname=3D... ", etc.

I can't think of a valid reason myself, assuming IIUC.

LCB


--=20
LC Bruzenak
MagitekLTD


--------------C6E58AF2CE9CAC9253CECB6A
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>On 4/20/20 5:29 PM, Paul Moore wrote:<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CAHC9VhSypHKGHeVVLF+fVEFkVmDCP0uCZ0s1FXRPzvnsr73sZQ@mail.gmail.=
com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, Apr 20, 2020 at 5:56 P=
M Richard Guy Briggs <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:rgb@=
redhat.com" moz-do-not-send=3D"true">&lt;rgb@redhat.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite" style=3D"color: #000000;">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 2020-04-20 17:36, Paul Mo=
ore wrote:
</pre>
        <blockquote type=3D"cite" style=3D"color: #000000;">
          <pre class=3D"moz-quote-pre" wrap=3D"">Commit 756125289285 ("audi=
t: always check the netlink payload length
in audit_receive_msg()") fixed a number of missing message length
checks, but forgot to check the length of userspace generated audit
records.  The good news is that you need CAP_AUDIT_WRITE to submit
userspace audit records, which is generally only given to trusted
processes, so the impact should be limited.

Cc: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:stable@vger.kernel=
.org" moz-do-not-send=3D"true">stable@vger.kernel.org</a>
Fixes: 756125289285 ("audit: always check the netlink payload length in aud=
it_receive_msg()")
Reported-by: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:syzbot+49=
e69b4d71a420ceda3e@syzkaller.appspotmail.com" moz-do-not-send=3D"true">syzb=
ot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com</a>
Signed-off-by: Paul Moore <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:paul@paul-moore.com" moz-do-not-send=3D"true">&lt;paul@paul-moore.com&gt;<=
/a>
---
 kernel/audit.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/audit.c b/kernel/audit.c
index b69c8b460341..87f31bf1f0a0 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -1326,6 +1326,9 @@ static int audit_receive_msg(struct sk_buff *skb, str=
uct nlmsghdr *nlh)
      case AUDIT_FIRST_USER_MSG2 ... AUDIT_LAST_USER_MSG2:
              if (!audit_enabled &amp;&amp; msg_type !=3D AUDIT_USER_AVC)
                      return 0;
+             /* exit early if there isn't at least one character to print =
*/
+             if (data_len &lt; 2)
+                     return -EINVAL;
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">Don't we want to issue the r=
ecord even if the message is empty?  If a
len of 1 is passed in, it will properly set str[0] =3D '\0' and str points
to a location with a null that prints nothing between the single quotes
of "msg=3D''".  So, I think that should be "if (data_len &lt; 1)".

Am I missing something?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">I've got no problem with allow=
ing an empty message so long as there is
a valid use for such a message.  Can anyone think of a valid reason
for having an empty userspace generated record?
</pre>
    </blockquote>
    <p>Not really. Using the libaudit interface(s), even if an empty
      message string is sent, and handled in the lib call(s), I believe
      it will have minimum contextual info, e.g. "exe=3D... hostname=3D...
      ", etc.</p>
    <p>I can't think of a valid reason myself, assuming IIUC.<br>
    </p>
    <p>LCB</p>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
LC Bruzenak
MagitekLTD</pre>
  </body>
</html>

--------------C6E58AF2CE9CAC9253CECB6A--

--===============9136615526811011628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============9136615526811011628==--

