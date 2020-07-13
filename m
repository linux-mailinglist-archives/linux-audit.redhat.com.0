Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF2121E384
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 01:09:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16--RdMrXgUMUuUXb3wEvd4hQ-1; Mon, 13 Jul 2020 19:09:43 -0400
X-MC-Unique: -RdMrXgUMUuUXb3wEvd4hQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3F008015F4;
	Mon, 13 Jul 2020 23:09:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8880379230;
	Mon, 13 Jul 2020 23:09:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07897180954D;
	Mon, 13 Jul 2020 23:09:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DN98UE012545 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 19:09:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48A211102E03; Mon, 13 Jul 2020 23:09:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4422D1102E02
	for <linux-audit@redhat.com>; Mon, 13 Jul 2020 23:09:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 419A4800296
	for <linux-audit@redhat.com>; Mon, 13 Jul 2020 23:09:06 +0000 (UTC)
Received: from sonic312-30.consmr.mail.ne1.yahoo.com
	(sonic312-30.consmr.mail.ne1.yahoo.com [66.163.191.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-148-vrMJXYQkOmyraY5ordMzJQ-1;
	Mon, 13 Jul 2020 19:09:03 -0400
X-MC-Unique: vrMJXYQkOmyraY5ordMzJQ-1
X-YMail-OSG: r_CLXfAVM1kCjXSgCaVP01r9KcTXIqvOY05d9laaUvd2wdEMrKdI6_.NllIWrZ9
	E1qpkQC517pbatIL6g17OlOAa4mhxKsGxA5.YFQcdy.usSOdUH3kG_S5fyxxt0lCxZ3xIMGbQzH9
	n01ZsMkgdh965fRyBNkWtp.5bLL2j7sVtEhuhaJ4346WZX8MJ09X2RVCJbplgE1Xdq2O6GrFM5Jt
	S5z33biPvBMfyCZ6If6USMbQ0DNKBJrhq3JfbY5qIGSfHcdHP.N2EgZBx8ZmnI4FU8DpZI3dSFCD
	EOUdUmdSTMGeFaeShp_isaGP7BlCFmDz6ulobZYNgW.mjt8u591_Nid.UPhu.853SFRNJCcCTbrO
	tUsCd9hinrOrtCC3Dcj.rge.0xirTWZhNXeEumL4A_lcbQh1so3JlsOdbgqk2nejw5_lCkvQQq0u
	yjSfCkkphLBaK.691ZggUdymTVClzVanZOYzGe84nI56JwwOkuuP5d73WYsCz3ZGSiwjoL30xTHs
	Ri5qld5WrPNNI3rbByKmiaGmUgPx5.THZ3whlU_V9Hejl2VqWBsQnuRTVT5PvXA.cGn9e7PZeSBn
	D1uld6v96ob_4fWtOdDdcy_R5_jiBXs1qL30g8Yg7Sd86E5RoD_1wu5FNbFU_AUl32hStE21IzCe
	l_kFrDiygpsb0o_r0kCtsrY3RGYZEceui7j8Na3_qAaorPmoUHROvQRmibNzXxyzO4VK4N.eMVzi
	xh1QzKmWISs38oINfC3ZFW4kc5Tj.XPX3af7aKlGmvQGXWyECu1iqlRLsnTZ5OY551fGuIVJ3M2f
	YsypOiwpxTD9SjIz8NHzmClP44Fkza.XRGBWDjHtomlkRuVi_T476VkkLfpLNpNK8W0MZYKZiUKo
	8Pfr37..T424N08aF.3j21ZJuopPw30oi.Z7f2WR8LprtSyA0K8TUFSI14rGntpDdrL7jm.RGS.L
	HdwSavWEeORoVwpnW0DpYK7cDRZh7fNZPx7O6m5QDB6V2a01Pta8I49GjLfsptOADR7bX68fwNHn
	Gd5JWnCExKl_bDGntb8YkPrUXCZX77qVyPMHusF_M0Z7KP8.SQOo9ODkci0CbWxvM5E7NT67UgE6
	TCbApXDWoZa1yeybGp79zvJy8khpR8AVWQ_vq_sI8BbYcZUebQ.V.yw23fKs9lQqZ9CE2DoLckDY
	ETAYbaYydU56KH2C.R4ajcwotaubJc6k4CfpXrLCO6Y01LoGDfQzcG2N4wjzkMfXAq3zMkYhzI7H
	cDZltoNj9L2DY4VLdmOZhGy4xtsXepaSvoyRuK1UlfCDmTbrTdU_3uFhOPeRX3WO86tZdbhj44j9
	I.ePz0IdLYDSaJTGZCQnjKEcAtIpBCbc2QaQin6RlBWO5v2.CeZEL6ivtZWLUymK86eKgMhYLxh.
	9TsGUUi8UE1M-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic312.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 13 Jul 2020 23:09:02 +0000
Received: by smtp411.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 73ac9cd347029fd2d31a78448247afc6; 
	Mon, 13 Jul 2020 23:08:58 +0000 (UTC)
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
To: Richard Guy Briggs <rgb@redhat.com>
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
	<20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
	<9ec00f40-e7e9-950e-4ed9-48533a9ee223@schaufler-ca.com>
	<20200713200214.qh3vnhcjozpnqf2l@madcap2.tricolour.ca>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <e2a183b2-35f4-8493-c485-8bf86e5866e9@schaufler-ca.com>
Date: Mon, 13 Jul 2020 16:08:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713200214.qh3vnhcjozpnqf2l@madcap2.tricolour.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06DN98UE012545
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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

On 7/13/2020 1:02 PM, Richard Guy Briggs wrote:
> On 2020-07-13 10:55, Casey Schaufler wrote:
>> On 7/13/2020 10:40 AM, Richard Guy Briggs wrote:
>>> On 2020-07-08 18:49, Paul Moore wrote:
>>>> On Fri, Jul 3, 2020 at 1:18 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>>>>> When there are no rules present, the event SOCKADDR record is not
>>>>> generated due to audit_dummy_context() generated at syscall entry from
>>>>> audit_n_rules.  Store this information if there is a context present to
>>>>> store it so that mandatory events are more complete (startup, LSMs...).
>> I don't know for sure, but this looks a lot like the issues
>> I have had to address for LSM stacking in
>>
>> [PATCH v18 20/23] Audit: Add new record for multiple process LSM attributes
>>
>> I don't know if the approach I took will help here, or be
>> acceptable at all for that matter. But it might be worth taking
>> a look.
> The first thing I notice is audit_stamp_context() looks pretty similar
> to audit_alloc_local() in

Sure does, doesn't it.

> [PATCH ghak90 V9 07/13] audit: add support for non-syscall auxiliary records
>
> which creates a local context for limited use by the primary record and
> local auxiliary records (contid) and is immediately tossed after those
> records.  One use case is network namespace events that are not (yet)
> tied to any user context ("[PATCH ghak90 V9 10/13] audit: add support
> for containerid to network namespaces").  The other is for user records
> that don't need to be tied to the userspace caller ("[PATCH ghak90 V9
> 08/13] audit: add containerid support for user records").
>
> How does this tie in with this situation?

In the case where subject LSM context information is being provided
and there is more than one LSM active that uses subject contexts
(e.g. AppArmor and SELinux, or AppArmor and Smack) the audit event can't
use the old "subj=xyz" field. Instead, the field will be "subj=?" and
a new record added to the event that contains all the subject contexts.
As is true in the cases you have here, not all the events involved are
syscall events. 

>   I would ideally like to
> retroactively capture the sockaddr information in the audit context
> struct (to avoid the overhead of always capturing sockaddr) to trigger a
> syscall record on exit along with a sockaddr record once a manadatory
> record has been triggered (such as audit or netfilter config, LSM event,
> etc...), depending only on audit_enabled.  There could be other
> substructures of audit context that would need filling out after it is
> determined that an audit event has happenned and information needs to be
> collected to support its reporting.

I'm not sure that I completely understand all that you're looking at,
but it does appear that I could switch to using your audit_alloc_local().
Do you think that has achieved its final form?



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

